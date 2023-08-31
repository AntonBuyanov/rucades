# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "Gem" do
    it "has a Ruby version number" do
      expect(Rucades::VERSION).not_to be nil
    end
  end

  describe "Version" do
    # Version cades object is an entity that you are not supposed to create directly
    # If created this way it reports random values, so we just check that methods exist
    it "has Version class" do
      v = Rucades::Version.new
      v.to_s
      v.major_version
      v.minor_version
      v.build_version
    end
  end
end
