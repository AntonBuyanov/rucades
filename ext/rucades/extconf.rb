# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

require "mkmf-rice"

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
  " -DSIZEOF_VOID_P=8",
  " -fpermissive",
  " -Wno-narrowing",
  " -Wno-deprecated-declarations",
  " -Wno-write-strings",
  " -DLEGACY_FORMAT_MESSAGE_IMPL"
].freeze

INCDIRS.each { |dir| $INCFLAGS << " -I#{dir}" }
CXXDEFS.each { |df| $defs << df }

$DLDFLAGS << " -L/opt/cprocsp/lib/amd64"
$LOCAL_LIBS << " -lcppcades"

$srcs = [
  "rucades.cpp",
  "rucades_const.cpp",
  "rucades_tools.cpp",
  "errormsg.cpp"
]

# rubocop:enable Style/GlobalVars
create_makefile("rucades/rucades")
