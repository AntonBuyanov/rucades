# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades
require "tempfile"

# rubocop:disable Metrics/BlockLength
RSpec.describe Rucades do
  describe "CRL" do
    it "has constructor" do
      crl = Rucades::CRL.new
      expect { crl.import("") }.to raise_error(RuntimeError)
    end

    it "has import and export methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
        f.rewind

        Tempfile.create("rucades", binmode: true) do |tmp|
          tmp.binmode
          tmp.write(crl.export(Rucades::CAPICOM_ENCODE_BINARY))
          tmp.rewind
          expect(tmp.read).to eq(f.read)
        end

        f.rewind
        Tempfile.create("rucades", binmode: false) do |tmp|
          tmp.puts("-----BEGIN X509 CRL-----")
          tmp.write(crl.export(Rucades::CAPICOM_ENCODE_BASE64))
          tmp.puts("-----END X509 CRL-----")
          tmp.rewind
          File.open(File.join(__dir__, "certificates", "certcrl.cer.crl"), "rt") do |tf|
            expect(tmp.read).to eq(tf.read)
          end
        end
      end
    end

    it "has issuer_name methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
      end
      expect(crl.issuer_name).to eq("CN=CRYPTO-PRO Test Center 2, O=CRYPTO-PRO LLC, L=Moscow, C=RU, E=support@cryptopro.ru")
    end

    it "has auth_key_id methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
      end
      expect(crl.auth_key_id).to eq("4E833E1469EFEC5D7A952B5F11FE37321649552B")
    end

    it "has next_update methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
      end
      expect(crl.next_update).to eq("01.09.2023 19:53:48")
    end

    it "has this_update methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
      end
      expect(crl.this_update).to eq("25.08.2023 07:33:48")
    end

    it "has thumbprint methods" do
      crl = Rucades::CRL.new
      File.open(File.join(__dir__, "certificates", "certcrl.p7b.crl"), "rb") do |f|
        crl.import(f.read)
      end
      expect(crl.thumbprint).to eq("44E43A6E7E9949A0FD0D1A61C8836626C3E31D5B")
    end
  end
end
# rubocop:enable Metrics/BlockLength
