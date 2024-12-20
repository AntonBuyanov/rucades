# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "Blobs" do
    it "has constructor and getters" do
      blobs = Rucades::Blobs.new
      expect(blobs.count).to eq(0)
      expect { blobs[0] }.to raise_error(RuntimeError)
    end
  end
end
