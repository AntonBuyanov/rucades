# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

RSpec.describe Rucades do
  describe "EncodedData" do
    it "has constructor and getters" do
      encdata = Rucades::EncodedData.new

      # Looks like format is not implemented
      expect { encdata.format(true) }.to raise_error(RuntimeError, "Not implemented. (0x80004001)")
      expect { encdata.format(false) }.to raise_error(RuntimeError, "Not implemented. (0x80004001)")
      expect { encdata.format }.to raise_error(RuntimeError, "Not implemented. (0x80004001)")

      expect(encdata.value(Rucades::CAPICOM_ENCODE_BINARY)).to eq("")
      # Not sure, why ???
      expect { encdata.value(Rucades::CAPICOM_ENCODE_BASE64) }.to raise_error(RuntimeError, "The parameter is incorrect. (0x80070057)")
      expect { encdata.value }.to raise_error(RuntimeError, "The parameter is incorrect. (0x80070057)")
    end
  end
end
