# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "Signers" do
    it "is a container of signers with count method" do
      signers = Rucades::Signers.new
      expect(signers.count).to eq(0)
    end
  end
end
