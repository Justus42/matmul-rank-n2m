// Minimal LRAT checker (RUP steps only; RAT steps are reported and rejected).
// Written by the S2-11 reviewer. Usage: lratchk FORMULA.cnf PROOF.lrat
use std::collections::HashMap;
use std::io::{BufRead, BufReader};
use std::fs::File;

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let cnf = BufReader::with_capacity(1 << 20, File::open(&a[1]).unwrap());
    let mut db: HashMap<u64, Vec<i32>> = HashMap::new();
    let mut nvars = 0usize;
    let mut ncl = 0u64;
    let mut cur: Vec<i32> = Vec::new();
    let mut declared = 0u64;
    for line in cnf.lines() {
        let line = line.unwrap();
        let t = line.trim();
        if t.is_empty() || t.starts_with('c') { continue; }
        if t.starts_with('p') {
            let p: Vec<&str> = t.split_whitespace().collect();
            nvars = p[2].parse().unwrap();
            declared = p[3].parse().unwrap();
            continue;
        }
        for x in t.split_whitespace() {
            let v: i32 = x.parse().unwrap();
            if v == 0 { ncl += 1; db.insert(ncl, std::mem::take(&mut cur)); }
            else { assert!((v.unsigned_abs() as usize) <= nvars); cur.push(v); }
        }
    }
    assert!(cur.is_empty(), "unterminated clause in CNF");
    assert_eq!(ncl, declared, "clause count mismatch in CNF header");
    eprintln!("cnf: vars={} clauses={}", nvars, ncl);
    // assignment: 0 unassigned, 1 true, -1 false (indexed by var)
    let mut val = vec![0i8; nvars + 1];
    let mut trail: Vec<usize> = Vec::new();
    let proof = BufReader::with_capacity(1 << 22, File::open(&a[2]).unwrap());
    let mut last_id = ncl;
    let mut added = 0u64;
    let mut empty = false;
    let mut rat_steps = 0u64;
    let lv = |val: &Vec<i8>, l: i32| -> i8 { let s = val[l.unsigned_abs() as usize]; if l > 0 { s } else { -s } };
    for (ln, line) in proof.lines().enumerate() {
        let line = line.unwrap();
        let t = line.trim();
        if t.is_empty() || t.starts_with('c') { continue; }
        let mut it = t.split_whitespace();
        let id: u64 = it.next().unwrap().parse().unwrap();
        let rest: Vec<&str> = it.collect();
        if rest.first() == Some(&"d") {
            for x in &rest[1..] { let d: u64 = x.parse().unwrap(); if d != 0 { db.remove(&d); } }
            continue;
        }
        assert!(id > last_id, "line {}: non-increasing clause id", ln + 1);
        last_id = id;
        let mut lits: Vec<i32> = Vec::new();
        let mut k = 0;
        loop { let v: i32 = rest[k].parse().unwrap(); k += 1; if v == 0 { break; } lits.push(v); }
        let mut hints: Vec<i64> = Vec::new();
        loop { let v: i64 = rest[k].parse().unwrap(); k += 1; if v == 0 { break; } hints.push(v); }
        assert!(k == rest.len(), "line {}: trailing tokens", ln + 1);
        // grow assignment for fresh (extension) variables
        for &l in &lits { let v = l.unsigned_abs() as usize; if v >= val.len() { val.resize(v + 1, 0); } }
        let taut = lits.iter().any(|&l| lits.contains(&-l));
        let mut ok = taut;
        if !ok {
            for &l in &lits {
                if lv(&val, l) == 0 { val[l.unsigned_abs() as usize] = if l > 0 { -1 } else { 1 }; trail.push(l.unsigned_abs() as usize); }
            }
            // RUP part: positive hints before the first negative one
            let first_neg = hints.iter().position(|&h| h < 0).unwrap_or(hints.len());
            match propagate(&db, &mut val, &mut trail, &hints[..first_neg], ln) { Some(true) => ok = true, _ => {} }
            if !ok {
                // RAT on pivot lits[0]
                assert!(!lits.is_empty(), "line {}: empty clause without RUP conflict", ln + 1);
                let p = lits[0];
                rat_steps += 1;
                // groups
                let mut groups: HashMap<u64, Vec<i64>> = HashMap::new();
                let mut cur: Option<u64> = None;
                for &h in &hints[first_neg..] {
                    if h < 0 { cur = Some((-h) as u64); groups.insert((-h) as u64, Vec::new()); }
                    else { groups.get_mut(&cur.unwrap()).unwrap().push(h); }
                }
                let base = trail.len();
                let mut ids: Vec<u64> = db.iter().filter(|(_, c)| c.contains(&-p)).map(|(k, _)| *k).collect();
                ids.sort();
                for did in ids {
                    let d = db[&did].clone();
                    // tautological resolvent?
                    if d.iter().any(|&l| l != -p && lits.contains(&-l)) { continue; }
                    let g = groups.get(&did).unwrap_or_else(|| panic!("line {}: RAT candidate {} without hint group", ln + 1, did));
                    let mut conflict = false;
                    for &l in &d { if l == -p { continue; } match lv(&val, l) { 0 => { val[l.unsigned_abs() as usize] = if l > 0 { -1 } else { 1 }; trail.push(l.unsigned_abs() as usize); } 1 => { conflict = true; } _ => {} } }
                    if !conflict { conflict = propagate(&db, &mut val, &mut trail, g, ln) == Some(true); }
                    if !conflict { panic!("line {}: RAT check failed for candidate {}", ln + 1, did); }
                    for v in trail.drain(base..) { val[v] = 0; }
                }
                ok = true;
            }
        }
        for v in trail.drain(..) { val[v] = 0; }
        if !ok { panic!("line {}: no conflict reached", ln + 1); }
        added += 1;
        if lits.is_empty() { empty = true; break; }
        db.insert(id, lits);
    }
    println!("lemmas_checked={} rat_steps={} empty_clause={}", added, rat_steps, empty);
    if empty { println!("s VERIFIED"); } else { println!("s NOT VERIFIED"); std::process::exit(1); }
}

fn lval(val: &Vec<i8>, l: i32) -> i8 { let s = val[l.unsigned_abs() as usize]; if l > 0 { s } else { -s } }

// Unit propagation along hints. Some(true) = conflict reached.
fn propagate(db: &HashMap<u64, Vec<i32>>, val: &mut Vec<i8>, trail: &mut Vec<usize>, hints: &[i64], ln: usize) -> Option<bool> {
    for &h in hints {
        let c = db.get(&(h as u64)).unwrap_or_else(|| panic!("line {}: hint {} not in DB", ln + 1, h));
        let mut unassigned = 0i32; let mut nun = 0;
        for &l in c {
            let v = l.unsigned_abs() as usize;
            let s = if v < val.len() { lval(val, l) } else { 0 };
            match s { 1 => panic!("line {}: hint {} satisfied", ln + 1, h), 0 => { if l != unassigned { nun += 1; unassigned = l; } } _ => {} }
        }
        if nun == 0 { return Some(true); }
        if nun > 1 { panic!("line {}: hint {} not unit", ln + 1, h); }
        let v = unassigned.unsigned_abs() as usize;
        if v >= val.len() { val.resize(v + 1, 0); }
        val[v] = if unassigned > 0 { 1 } else { -1 };
        trail.push(v);
    }
    Some(false)
}
