# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "SignatureStatus" do
    it "has constructor and getter" do
      sig = Rucades::SignatureStatus.new
      expect(sig.is_a?(Rucades::SignatureStatus)).to be(true)
      expect(sig.valid?).to be(false)
    end
  end
end
