# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

# rubocop:disable Metrics/BlockLength
RSpec.describe Rucades do
  describe "Signer" do
    let(:signer) do
      Rucades::Signer.new
    end

    it "has constructor and pin setter" do
      expect(signer.is_a?(Rucades::Signer)).to be(true)
      signer.key_pin = "12345678"
    end

    it "holds certificate" do
      cert = Rucades::Certificate.new
      File.open(File.join(__dir__, "certificates", "certusr.cer"), "rb") do |f|
        cert.import(f.read)
      end
      signer.certificate = cert
      expect(signer.certificate.thumbprint).to eq(cert.thumbprint)
    end

    it "holds cerificate check flag" do
      signer.check_certificate = true
      expect(signer.check_certificate).to be(true)
      signer.check_certificate = false
      expect(signer.check_certificate).to be(false)
    end

    it "holds options" do
      signer.options = Rucades::CAPICOM_CERTIFICATE_INCLUDE_WHOLE_CHAIN
      expect(signer.options).to eq(Rucades::CAPICOM_CERTIFICATE_INCLUDE_WHOLE_CHAIN)
      signer.options = Rucades::CAPICOM_CERTIFICATE_INCLUDE_END_ENTITY_ONLY
      expect(signer.options).to eq(Rucades::CAPICOM_CERTIFICATE_INCLUDE_END_ENTITY_ONLY)
    end

    it "holds tsa address" do
      signer.tsa_address = "http://testca.cryptopro.ru/tsp/"
      expect(signer.tsa_address).to eq("http://testca.cryptopro.ru/tsp/")
    end

    it "holds attributes" do
      auth_attrbs = Rucades::Attributes.new
      auth_attrbs << Rucades::Attribute.new << Rucades::Attribute.new << Rucades::Attribute.new

      unauth_attrbs = Rucades::Attributes.new
      unauth_attrbs << Rucades::Attribute.new

      signer.authenticated_attributes = auth_attrbs
      signer.unauthenticated_attributes = unauth_attrbs

      expect(signer.authenticated_attributes.count).to eq(3)
      expect(signer.unauthenticated_attributes.count).to eq(1)
    end

    it "has crls, ocsp responses, signing_time, signature_time_stamp_time getter" do
      expect(signer.crls.count).to eq(0)
      expect(signer.ocsp_responses.count).to eq(0)

      expect { signer.signing_time }.to raise_error(RuntimeError)
      expect { signer.signature_time_stamp_time }.to raise_error(RuntimeError)
    end
  end
end
# rubocop:enable Metrics/BlockLength
