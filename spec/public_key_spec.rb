# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

KEY_VALUE = "BEBP8nfp8ferXuJR6JbfMISh9DhBhGRMUpP05gMaLbyEWLsV2clyYOpo8oSIHbF+\nzE7Pw+IBMqTG3DMFNdKabpGg\n"

RSpec.describe Rucades do
  describe "PublicKey" do
    it "has constructor and getters" do
      pkey = Rucades::PublicKey.new

      expect(pkey.length).to eq(0)
      expect(pkey.algorithm.name).to eq(Rucades::CAPICOM_OID_OTHER)
      expect(pkey.encoded_key.value(Rucades::CAPICOM_ENCODE_BINARY)).to eq("")
      expect(pkey.encoded_parameters.value(Rucades::CAPICOM_ENCODE_BINARY)).to eq("")
    end

    it "holds real values" do
      crt = Rucades::Certificate.new
      File.open(File.join(__dir__, "certificates", "certusr.cer"), "rb") do |f|
        crt.import(f.read)
      end
      pkey = crt.public_key
      expect(pkey.length).to eq(512)
      expect(pkey.encoded_key.value(Rucades::CAPICOM_ENCODE_BASE64)).to eq(KEY_VALUE)
      expect(pkey.encoded_parameters.value(Rucades::CAPICOM_ENCODE_BASE64)).to eq("MBMGByqFAwICJAAGCCqFAwcBAQIC\n")
    end
  end
end
