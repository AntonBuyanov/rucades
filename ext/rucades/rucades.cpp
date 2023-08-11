// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#include <rice/rice.hpp>
#include <rice/stl.hpp>

#include "rucades.h"
#include "rucades_about.h"
#include "rucades_version.h"

using namespace Rice;
using namespace rucades;

extern "C"
void Init_rucades(void)
{
  VALUE rb_mRucades = rb_define_module("Rucades");
  define_constants(rb_mRucades);

  Data_Type<pre_rb_Version> rb_cVersion =
    define_class<pre_rb_Version>("Version")
    .define_constructor(Constructor<pre_rb_Version>())
    .define_method("major_version", &pre_rb_Version::major_version)
    .define_method("minor_version", &pre_rb_Version::minor_version)
    .define_method("build_version", &pre_rb_Version::build_version)
    .define_method("to_s", &pre_rb_Version::to_s);

  Data_Type<CryptoPro::PKI::CAdES::CPPCadesAboutObject> rb_cAbout =
    define_class<pre_rb_About>("About")
    .define_constructor(Constructor<pre_rb_About>())
    .define_method("major_version", &pre_rb_About::major_version)
    .define_method("minor_version", &pre_rb_About::minor_version)
    .define_method("build_version", &pre_rb_About::build_version)
    .define_method("version", &pre_rb_About::version)
    .define_method("plugin_version", &pre_rb_About::plugin_version, Return().takeOwnership())
    .define_method("csp_version", &pre_rb_About::csp_version, Return().takeOwnership(),
                   Arg("prov_name") = (std::string)"", Arg("prov_type") = (long)75);
}
