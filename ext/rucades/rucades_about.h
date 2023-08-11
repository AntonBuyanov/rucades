// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#pragma once

#include "rucades.h"
#include "rucades_version.h"
#include "CPPCadesAbout.h"

namespace rucades {
class pre_rb_About: protected CryptoPro::PKI::CAdES::CPPCadesAboutObject {
  public:
    pre_rb_About(void): CryptoPro::PKI::CAdES::CPPCadesAboutObject() { }

    unsigned int major_version(void) {
      unsigned int version = 0;
      hr_method_check(get_MajorVersion(&version));
      return version;
    }
    unsigned int minor_version(void) {
      unsigned int version = 0;
      hr_method_check(get_MinorVersion(&version));
      return version;
    }
    unsigned int build_version(void) {
      unsigned int version = 0;
      hr_method_check(get_BuildVersion(&version));
      return version;
    }
    std::string version(void) {
      CAtlString AtlVersion;
      hr_method_check(get_Version(AtlVersion));
      return AtlVersion.GetString();
    }

    pre_rb_Version* plugin_version(void) {
      boost::shared_ptr<CryptoPro::PKI::CAdES::CPPVersionObject> p_version;
      hr_method_check(get_PluginVersion(p_version));
      return new pre_rb_Version(p_version);
    }

    pre_rb_Version* csp_version(std::string prov_name, long prov_type) {
      boost::shared_ptr<CryptoPro::PKI::CAdES::CPPVersionObject> p_version;
      CAtlString provName = CAtlString(CA2CT(CAtlStringA(prov_name.c_str()), CP_UTF8));

      hr_method_check(get_CSPVersion(provName, prov_type, p_version));
      return new pre_rb_Version(p_version);
    }
};
}
