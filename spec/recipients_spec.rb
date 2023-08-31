# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "Recipients" do
    it "is a container of certificates with add/remove/clear/count methods" do
      rcps = Rucades::Recipients.new
      expect(rcps.count).to eq(0)

      rcps.add Rucades::Certificate.new
      expect(rcps.count).to eq(1)

      rcps << Rucades::Certificate.new << Rucades::Certificate.new
      expect(rcps.count).to eq(3)

      rcps.remove(1)
      expect(rcps.count).to eq(2)

      rcps.clear
      expect(rcps.count).to eq(0)
    end
  end
end
