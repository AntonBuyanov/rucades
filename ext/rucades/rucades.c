#include "rucades.h"

VALUE rb_mRucades;

void
Init_rucades(void)
{
  rb_mRucades = rb_define_module("Rucades");
}
