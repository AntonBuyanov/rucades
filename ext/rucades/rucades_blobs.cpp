// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#include <rice/rice.hpp>
#include <rice/stl.hpp>

#include "rucades.h"
#include "rucades_blobs.h"

using namespace Rice;
using namespace CryptoPro;
using namespace CryptoPro::PKI::CAdES;

namespace rucades {
pre_rb_Blobs::pre_rb_Blobs(void):
      m_pCppCadesImpl(boost::shared_ptr<CPPCadesCPBlobsObject>(new CPPCadesCPBlobsObject())) { }

long pre_rb_Blobs::get_count(void){
    DWORD count = 0;
    hr_method_check(m_pCppCadesImpl->get_Count(&count));
    return count;
}

std::string pre_rb_Blobs::get_item(long index)
{
    boost::shared_ptr<CBlob> pEncValueBlob = boost::shared_ptr<CBlob>(new CBlob());
    hr_method_check(m_pCppCadesImpl->get_Item(index, pEncValueBlob));

    CAtlString sValue;
    sValue = CAtlString((const TCHAR *)pEncValueBlob->pbData(), pEncValueBlob->cbData() / sizeof(TCHAR));
    return std::string(sValue.GetString());
}

void pre_rb_Blobs::define_ruby_class(void)
{
  Data_Type<pre_rb_Blobs> rb_cBlobs =
    define_class<pre_rb_Blobs>("Blobs")
    .define_constructor(Constructor<pre_rb_Blobs>())
    .define_method("count", &pre_rb_Blobs::get_count)
    .define_method("[]", &pre_rb_Blobs::get_item);
}
}
