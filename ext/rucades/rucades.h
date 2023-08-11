// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#pragma once

#include "stdafx.h"
#include "cppcades.h"
#include "ruby.h"

namespace rucades {
void define_constants(VALUE module);
void hr_method_check(HRESULT hr);
}