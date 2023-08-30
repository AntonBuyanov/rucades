// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#pragma once

#include "rucades.h"
#include "CPPCadesCollections.h"

namespace rucades {
class pre_rb_Blobs {
  protected:
    boost::shared_ptr<CryptoPro::PKI::CAdES::CPPCadesCPBlobsObject> m_pCppCadesImpl;
  public:
    pre_rb_Blobs(void);
    long get_count(void);
    std::string get_item(long index);

    static void define_ruby_class(void);
};
}
