// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#include <rice/rice.hpp>
#include <rice/stl.hpp>

#include "rucades.h"
#include "rucades_about.h"
#include "rucades_algorithm.h"
#include "rucades_attribute.h"
#include "rucades_attributes.h"
#include "rucades_basic_constraints.h"
#include "rucades_blobs.h"
#include "rucades_certificate.h"
#include "rucades_certificates.h"
#include "rucades_certificate_status.h"
#include "rucades_crl.h"
#include "rucades_eku.h"
#include "rucades_ekus.h"
#include "rucades_encoded_data.h"
#include "rucades_extended_key_usage.h"
#include "rucades_key_usage.h"
#include "rucades_oid.h"
#include "rucades_private_key.h"
#include "rucades_public_key.h"
#include "rucades_store.h"
#include "rucades_version.h"

using namespace Rice;
using namespace rucades;

extern "C"
void Init_rucades(void)
{
  VALUE rb_mRucades = rb_define_module("Rucades");
  define_constants(rb_mRucades);

  pre_rb_Version::define_ruby_class();
  pre_rb_About::define_ruby_class();

  pre_rb_OID::define_ruby_class();

  pre_rb_Algorithm::define_ruby_class();
  pre_rb_Attribute::define_ruby_class();
  pre_rb_Attributes::define_ruby_class();
  pre_rb_BasicConstraints::define_ruby_class();
  pre_rb_Blobs::define_ruby_class();
  pre_rb_CertificateStatus::define_ruby_class();
  pre_rb_CRL::define_ruby_class();
  pre_rb_EKU::define_ruby_class();
  pre_rb_EKUs::define_ruby_class();
  pre_rb_EncodedData::define_ruby_class();
  pre_rb_ExtendedKeyUsage::define_ruby_class();
  pre_rb_KeyUsage::define_ruby_class();
  pre_rb_PrivateKey::define_ruby_class();
  pre_rb_PublicKey::define_ruby_class();

  pre_rb_Certificate::define_ruby_class();
  pre_rb_Certificates::define_ruby_class();
  pre_rb_Store::define_ruby_class();
  pre_rb_Certificate::extend_ruby_class();

}
