# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "SignedData" do
    let(:signed_data) do
      Rucades::SignedData.new
    end

    it "has constructor" do
      expect(signed_data.is_a?(Rucades::SignedData)).to be(true)
    end

    it "has content_encoding setter and getter" do
      signed_data.content_encoding = Rucades::CAPICOM_ENCODE_BINARY
      expect(signed_data.content_encoding).to eq(Rucades::CAPICOM_ENCODE_BINARY)
      signed_data.content_encoding = Rucades::CAPICOM_ENCODE_BASE64
      expect(signed_data.content_encoding).to eq(Rucades::CAPICOM_ENCODE_BASE64)
    end

    it "has content setter and getter" do
      signed_data.content = "test"
      expect(signed_data.content).to eq("test")
    end
  end
end
