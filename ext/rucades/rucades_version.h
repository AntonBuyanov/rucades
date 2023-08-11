// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#pragma once

#include "rucades.h"
#include "CPPVersion.h"

namespace rucades {
class pre_rb_Version: protected CryptoPro::PKI::CAdES::CPPVersionObject {
  public:
    pre_rb_Version(void): CryptoPro::PKI::CAdES::CPPVersionObject() { }
    pre_rb_Version(boost::shared_ptr<CryptoPro::PKI::CAdES::CPPVersionObject> b):
      CryptoPro::PKI::CAdES::CPPVersionObject() {
        unsigned int major, minor, build;
        hr_method_check(b->get_MajorVersion(&major));
        hr_method_check(b->get_MinorVersion(&minor));
        hr_method_check(b->get_BuildVersion(&build));
        hr_method_check(Initialize(major, minor, build, false));
      }

    unsigned int major_version(void) {
      unsigned int version = 0;
      hr_method_check(CryptoPro::PKI::CAdES::CPPVersionObject::get_MajorVersion(&version));
      return version;
    }
    unsigned int minor_version(void) {
      unsigned int version = 0;
      hr_method_check(CryptoPro::PKI::CAdES::CPPVersionObject::get_MinorVersion(&version));
      return version;
    }
    unsigned int build_version(void) {
      unsigned int version = 0;
      hr_method_check(CryptoPro::PKI::CAdES::CPPVersionObject::get_BuildVersion(&version));
      return version;
    }
    std::string to_s(void){
      CAtlString AtlVersion;
      hr_method_check(CryptoPro::PKI::CAdES::CPPVersionObject::toString(AtlVersion));
      return AtlVersion.GetString();
    }
};
}
