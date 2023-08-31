# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "EnvelopedData" do
    it "has constructor" do
      hdata = Rucades::EnvelopedData.new
      expect(hdata.is_a?(Rucades::EnvelopedData)).to be(true)
    end
    it "can store data" do
      hdata = Rucades::EnvelopedData.new
      hdata.content = "data"
      expect(hdata.content).to eq("data")
    end
  end
end
