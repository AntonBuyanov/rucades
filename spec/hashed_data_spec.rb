# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "HashedData" do
    it "has constructor and can store hash" do
      hdata = Rucades::HashedData.new
      hdata.hash "data"
      expect(hdata.value).to eq("8933E3FB85CC1457BFB8A5705315527169ED23819AFB76CCBB52B9113A28FFB4")
    end
  end
end
