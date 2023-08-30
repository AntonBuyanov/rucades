# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "CerificateStatus" do
    it "has constructor and getter" do
      certstatus = CertificateStatus.new
      expect(certstatus.result?).to be(false)
    end
  end
end
