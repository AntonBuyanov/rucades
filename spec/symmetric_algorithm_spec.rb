# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "SymmetricAlgorithm" do
    let(:sym_alg) do
      Rucades::SymmetricAlgorithm.new
    end

    it "has constructor" do
      expect(sym_alg.is_a?(Rucades::SymmetricAlgorithm)).to be(true)
    end
  end
end
