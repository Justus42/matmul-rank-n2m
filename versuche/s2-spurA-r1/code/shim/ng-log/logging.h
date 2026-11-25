#pragma once
// S2-02: own shim, not from upstream. Wang's code includes "ng-log/logging.h";
// ng-log is a fork of glog with the same macros, so we map it onto system glog.
// Shim: map ng-log onto glog (ng-log is a fork of glog with the same macros).
#include <glog/logging.h>
namespace nglog { inline void InitializeLogging(const char* argv0) { google::InitGoogleLogging(argv0); } }
