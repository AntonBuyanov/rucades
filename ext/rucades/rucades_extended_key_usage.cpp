// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#include <rice/rice.hpp>
#include <rice/stl.hpp>

#include "rucades.h"
#include "rucades_extended_key_usage.h"

using namespace Rice;
using namespace CryptoPro::PKI::CAdES;

namespace rucades {
pre_rb_ExtendedKeyUsage::pre_rb_ExtendedKeyUsage(void):
  m_pCppCadesImpl(new CryptoPro::PKI::CAdES::CPPCadesCPExtendedKeyUsageObject()) { }

pre_rb_ExtendedKeyUsage::pre_rb_ExtendedKeyUsage(boost::shared_ptr<CPPCadesCPExtendedKeyUsageObject> other):
      m_pCppCadesImpl(other) { }

bool pre_rb_ExtendedKeyUsage::is_present(void)
{
    BOOL bIsPresent;
    m_pCppCadesImpl->get_IsPresent(&bIsPresent);
    return (bIsPresent != FALSE);
}

bool pre_rb_ExtendedKeyUsage::is_critical(void)
{
    BOOL bIsCritical;
    m_pCppCadesImpl->get_IsCritical(&bIsCritical);
    return (bIsCritical != FALSE);
}

pre_rb_EKUs* pre_rb_ExtendedKeyUsage::get_ekus(void)
{

    boost::shared_ptr<CPPCadesCPEKUsObject> pCppCadesEKUs(new CPPCadesCPEKUsObject());
    hr_method_check(m_pCppCadesImpl->get_EKUs(pCppCadesEKUs));

    return new pre_rb_EKUs(pCppCadesEKUs);
}

void pre_rb_ExtendedKeyUsage::define_ruby_class(void)
{
  Data_Type<pre_rb_ExtendedKeyUsage> rb_cExtendedKeyUsage =
    define_class<pre_rb_ExtendedKeyUsage>("ExtendedKeyUsage")
    .define_constructor(Constructor<pre_rb_ExtendedKeyUsage>())
    .define_method("present?", &pre_rb_ExtendedKeyUsage::is_present)
    .define_method("critical?", &pre_rb_ExtendedKeyUsage::is_critical)
    .define_method("ekus", &pre_rb_ExtendedKeyUsage::get_ekus, Return().takeOwnership());
}
}
