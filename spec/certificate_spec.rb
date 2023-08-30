# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

# rubocop:disable Metrics/BlockLength
RSpec.describe Rucades do
  describe "Certificate" do
    it "has constructor" do
      crt = Certificate.new
      expect { crt.has_private_key? }.to raise_error(RuntimeError)
    end

    it "has import and export methods" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
        f.rewind

        Tempfile.create("rucades", binmode: true) do |tmp|
          tmp.binmode
          tmp.write(crt.export(Rucades::CAPICOM_ENCODE_BINARY))
          tmp.rewind
          expect(tmp.read).to eq(f.read)
        end

        f.rewind
        Tempfile.create("rucades", binmode: false) do |tmp|
          tmp.puts("-----BEGIN CERTIFICATE-----")
          tmp.write(crt.export(Rucades::CAPICOM_ENCODE_BASE64))
          tmp.puts("-----END CERTIFICATE-----")
          tmp.rewind
          File.open(File.join(__dir__, "certificates", "certnew.cer"), "rt") do |tf|
            expect(tmp.read).to eq(tf.read)
          end
        end
      end
    end

    it "has subject_name method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.subject_name).to eq("CN=CRYPTO-PRO Test Center 2, O=CRYPTO-PRO LLC, L=Moscow, C=RU, E=support@cryptopro.ru")
    end

    it "has issuer_name method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.issuer_name).to eq("CN=CRYPTO-PRO Test Center 2, O=CRYPTO-PRO LLC, L=Moscow, C=RU, E=support@cryptopro.ru")
    end

    it "has serial_number method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.serial_number).to eq("37418882F539A5924AD44E3DE002EA3C")
    end

    it "has thumbprint method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.thumbprint).to eq("CD321B87FDABB503829F88DB68D893B59A7C5DD3")
    end

    it "has version method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.version).to eq(3)
    end

    it "has version method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.version).to eq(3)
    end

    it "has valid_from_date method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.valid_from_date).to eq("27.05.2019 07:24:26")
    end

    it "has valid_to_date method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
      expect(crt.valid_to_date).to eq("26.05.2024 07:34:05")
    end

    it "has has_private_key? method" do
      crt = Certificate.new
      File.open(File.join(__dir__, "certificates", "certnew.p7b"), "rb") do |f|
        crt.import(f.read)
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
