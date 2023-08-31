# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "RawSignature" do
    it "has constructor" do
      sig = Rucades::RawSignature.new
      expect(sig.is_a?(Rucades::RawSignature)).to be(true)
    end
  end
end
