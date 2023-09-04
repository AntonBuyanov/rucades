# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

require "mkmf-rice"
require "fiddle"

# rubocop:disable Style/GlobalVars

INCDIRS = [
  "/usr/include/boost",
  "/opt/cprocsp/include",
  "/opt/cprocsp/include/cpcsp",
  "/opt/cprocsp/include/pki/atl",
  "/opt/cprocsp/include/pki/cppcades",
  "/opt/cprocsp/include/pki/cplib",
  "/opt/cprocsp/include/pki"
].freeze

CXXDEFS = [
  " -DUNIX",
  " -fpermissive",
  " -Wno-narrowing",
  " -Wno-deprecated-declarations",
  " -Wno-write-strings",
  " -DLEGACY_FORMAT_MESSAGE_IMPL"
].freeze

ARM64_CXXDEFS = [
  "-DLINUX",
  "-DPROC_TYPE_ARM64=7",
  "-DPROCESSOR_TYPE=PROC_TYPE_ARM64",
  "-Wno-write-strings"
].freeze

INCDIRS.each { |dir| $INCFLAGS << " -I#{dir}" }

$defs << " -DSIZEOF_VOID_P=#{Fiddle::SIZEOF_VOIDP}"

CXXDEFS.each { |df| $defs << df }
ARM64_CXXDEFS.each { |df| $defs << df } if RUBY_PLATFORM =~ /aarch64-linux/

if RUBY_PLATFORM =~ /aarch64-linux/ 
  $DLDFLAGS << " -L/opt/cprocsp/lib/aarch64"  
else
  $DLDFLAGS << " -L/opt/cprocsp/lib/amd64"
end

$LOCAL_LIBS << " -lcppcades"

$srcs = [
  "rucades.cpp",
  "rucades_const.cpp",
  "rucades_tools.cpp",
  "errormsg.cpp",
  "rucades_about.cpp",
  "rucades_algorithm.cpp",
  "rucades_attribute.cpp",
  "rucades_attributes.cpp",
  "rucades_basic_constraints.cpp",
  "rucades_blobs.cpp",
  "rucades_certificate.cpp",
  "rucades_certificates.cpp",
  "rucades_certificate_status.cpp",
  "rucades_crl.cpp",
  "rucades_eku.cpp",
  "rucades_ekus.cpp",
  "rucades_encoded_data.cpp",
  "rucades_enveloped_data.cpp",
  "rucades_extended_key_usage.cpp",
  "rucades_hashed_data.cpp",
  "rucades_key_usage.cpp",
  "rucades_oid.cpp",
  "rucades_private_key.cpp",
  "rucades_public_key.cpp",
  "rucades_raw_signature.cpp",
  "rucades_recipients.cpp",
  "rucades_signature_status.cpp",
  "rucades_signed_data.cpp",
  "rucades_signed_xml.cpp",
  "rucades_signer.cpp",
  "rucades_signers.cpp",
  "rucades_store.cpp",
  "rucades_symmetric_algorithm.cpp",
  "rucades_version.cpp"
]

# rubocop:enable Style/GlobalVars
create_makefile("rucades/rucades")
