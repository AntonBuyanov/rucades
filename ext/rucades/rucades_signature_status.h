// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#pragma once

#include "rucades.h"
#include "CPPCadesSignatureStatus.h"

namespace rucades {
class pre_rb_SignatureStatus {
  protected:
    boost::shared_ptr<CryptoPro::PKI::CAdES::CPPCadesSignatureStatusObject> m_pCppCadesImpl;
  public:
    pre_rb_SignatureStatus(void);
    pre_rb_SignatureStatus(boost::shared_ptr<CryptoPro::PKI::CAdES::CPPCadesSignatureStatusObject> other);
    bool is_valid(void);

    static void define_ruby_class(VALUE module);

    friend class pre_rb_Signer;
};
}
