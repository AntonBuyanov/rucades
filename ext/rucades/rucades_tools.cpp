// Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
// All rights reserved.
// This file is a part of rucades

#include "rucades.h"

namespace rucades {
void hr_method_check(HRESULT hr) {
  if (hr != S_OK) {
    CAtlStringW message = GetErrorMessage(HRESULT_FROM_WIN32(hr),
                                          MAKELANGID(LANG_ENGLISH, SUBLANG_ENGLISH_US));
    wchar_t buff[14];
    swprintf(buff, 14, L" (0x%08X)", hr);
    message.Append(buff);
    throw std::runtime_error(CW2A(message, CP_UTF8));
  }
}
}