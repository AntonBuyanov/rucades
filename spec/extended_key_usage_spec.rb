# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "ExtendedKeyUsage" do
    it "has constructor and getters" do
      kusage = Rucades::ExtendedKeyUsage.new
      expect(kusage.present?).to be(false)
      expect(kusage.critical?).to be(false)
      expect(kusage.ekus.count).to eq(0)
    end
  end
end
