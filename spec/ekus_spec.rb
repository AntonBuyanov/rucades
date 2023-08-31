# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "EKUs" do
    it "has constructor and getters" do
      ekus = Rucades::EKUs.new
      expect(ekus.count).to eq(0)
      expect { ekus[0] }.to raise_error(RuntimeError)
    end
  end
end
