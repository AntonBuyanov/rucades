# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "PrivateKey" do
    it "has constructor" do
      pk = PrivateKey.new
      expect { pk.container_name }.to raise_error(RuntimeError)
    end
  end
end
