# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "EKU" do
    it "has constructor and getters/setters" do
      eku = Rucades::EKU.new

      eku.name = Rucades::CAPICOM_EKU_OTHER
      expect(eku.name).to eq(Rucades::CAPICOM_EKU_OTHER)

      eku.name = Rucades::CAPICOM_EKU_CLIENT_AUTH
      expect(eku.name).to eq(Rucades::CAPICOM_EKU_CLIENT_AUTH)

      eku.oid = "1.3.6.1.5.5.7.3.1"     # "Проверка подлинности сервера"  Rucades::CAPICOM_OID_SERVER_AUTH_EKU
      expect(eku.oid).to eq("1.3.6.1.5.5.7.3.1")
      expect(eku.name).to eq(Rucades::CAPICOM_EKU_SERVER_AUTH)

      eku.oid = "2.5.29.10"             # "Основные ограничения"          Rucades::CAPICOM_OID_BASIC_CONSTRAINTS_EXTENSION
      expect(eku.name).to eq(Rucades::CAPICOM_EKU_OTHER)
    end
  end
end
