# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "SignedXML" do
    let(:signed_xml) do
      Rucades::SignedXML.new
    end

    it "has constructor" do
      expect(signed_xml.is_a?(Rucades::SignedXML)).to be(true)
    end

    it "has content setter and getter" do
      signed_xml.content = "test 1"
      expect(signed_xml.content).to eq("test 1")
      signed_xml.content = "test 2"
      expect(signed_xml.content).to eq("test 2")
    end

    it "has signature_type, digest_method, signature_method setter" do
      signed_xml.signature_type = Rucades::CADESCOM_XML_SIGNATURE_TYPE_ENVELOPED
      signed_xml.digest_method = "sha256"
      signed_xml.signature_method = Rucades::XmlDsigGost3410Url2012512
    end
  end
end
