# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

# rubocop:disable Metrics/BlockLength
RSpec.describe Rucades do
  describe "Attributes" do
    it "is a container of attributes with add/remove/clear/count methods" do
      attrbs = Rucades::Attributes.new
      expect(attrbs.count).to eq(0)

      attrbs << Rucades::Attribute.new
      expect(attrbs.count).to eq(1)

      attrbs << Rucades::Attribute.new << Rucades::Attribute.new
      expect(attrbs.count).to eq(3)

      attrbs.remove(1)
      expect(attrbs.count).to eq(2)

      attrbs.clear
      expect(attrbs.count).to eq(0)
    end
  end

  it "holds real values" do
    attrb1 = Rucades::Attribute.new
    attrb1.name = Rucades::CADESCOM_AUTHENTICATED_ATTRIBUTE_DOCUMENT_DESCRIPTION
    attrb1.value_type = Rucades::CAPICOM_ENCODE_BINARY
    attrb1.value = "Test 1"
    expect(attrb1.value).to eq("Test 1")

    attrb2 = Rucades::Attribute.new
    attrb2.name = Rucades::CADESCOM_AUTHENTICATED_ATTRIBUTE_DOCUMENT_DESCRIPTION
    attrb2.value_type = Rucades::CAPICOM_ENCODE_BINARY
    attrb2.value = "Test 2"
    expect(attrb2.value).to eq("Test 2")

    attrbs = Rucades::Attributes.new
    attrbs << attrb1

    expect(attrbs[1].value).to eq("Test 1")
    attrbs << Rucades::Attribute.new << Rucades::Attribute.new << attrb2 << Rucades::Attribute.new

    expect(attrbs[4].value).to eq("Test 2")
    attrbs.remove(1)
    expect(attrbs[3].value).to eq("Test 2")
  end
end
# rubocop:enable Metrics/BlockLength
