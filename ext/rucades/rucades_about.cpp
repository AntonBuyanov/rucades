#include <rice/rice.hpp>
#include <rice/stl.hpp>

#include "rucades.h"
#include "rucades_about.h"

using namespace Rice;
using namespace CryptoPro::PKI::CAdES;

namespace rucades {
pre_rb_About::pre_rb_About(void):
      m_pCppCadesImpl(std::make_shared<CPPCadesAboutObject>()) { }

unsigned int pre_rb_About::major_version(void)
{
  unsigned int version = 0;
  hr_method_check(m_pCppCadesImpl->get_MajorVersion(&version));
  return version;
}

unsigned int pre_rb_About::minor_version(void)
{
  unsigned int version = 0;
  hr_method_check(m_pCppCadesImpl->get_MinorVersion(&version));
  return version;
}

unsigned int pre_rb_About::build_version(void)
{
  unsigned int version = 0;
  hr_method_check(m_pCppCadesImpl->get_BuildVersion(&version));
  return version;
}

std::string pre_rb_About::version(void)
{
  CAtlString AtlVersion;
  hr_method_check(m_pCppCadesImpl->get_Version(AtlVersion));
  return AtlVersion.GetString();
}

pre_rb_Version pre_rb_About::plugin_version(void)
{
  // Используем std::shared_ptr вместо boost::shared_ptr
  std::shared_ptr<CryptoPro::PKI::CAdES::CPPVersionObject> p_version = std::make_shared<CryptoPro::PKI::CAdES::CPPVersionObject>();
  hr_method_check(m_pCppCadesImpl->get_PluginVersion(p_version));
  return pre_rb_Version(p_version);
}

pre_rb_Version pre_rb_About::csp_version(std::string prov_name, long prov_type)
{
  // Используем std::shared_ptr вместо boost::shared_ptr
  std::shared_ptr<CryptoPro::PKI::CAdES::CPPVersionObject> p_version = std::make_shared<CryptoPro::PKI::CAdES::CPPVersionObject>();
  CAtlString provName = CAtlString(CA2CT(CAtlStringA(prov_name.c_str()), CP_UTF8));

  hr_method_check(m_pCppCadesImpl->get_CSPVersion(provName, prov_type, p_version));
  return pre_rb_Version(p_version);
}

void pre_rb_About::define_ruby_class(VALUE module)
{
  Data_Type<pre_rb_About> rb_cAbout =
    define_class_under<pre_rb_About>(module, "About")
    .define_constructor(Constructor<pre_rb_About>())
    .define_method("major_version", &pre_rb_About::major_version)
    .define_method("minor_version", &pre_rb_About::minor_version)
    .define_method("build_version", &pre_rb_About::build_version)
    .define_method("version", &pre_rb_About::version)
    .define_method("plugin_version", &pre_rb_About::plugin_version)
    .define_method("csp_version", &pre_rb_About::csp_version,
                   Arg("prov_name") = (std::string)"", Arg("prov_type") = (long)75);
}
}
