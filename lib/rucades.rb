# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

require_relative "rucades/version"
require_relative "rucades/rucades"

module Rucades
  # Polyfill for Certificates.find
  class Certificates
    def find(type, *args)
      return find_no_query(type) if args.empty?

      valid_only = (args.length == 1 ? 0 : -1)
      return internal_find_query_string(type, args[1], valid_only) if args[1].is_a?(String)

      internal_find_query_long(type, args[1], valid_only)
    end

    private

    def find_no_query(type)
      if type != Rucades::CAPICOM_CERTIFICATE_FIND_TIME_VALID &&
         type != Rucades::CAPICOM_CERTIFICATE_FIND_TIME_NOT_YET_VALID &&
         type != Rucades::CAPICOM_CERTIFICATE_FIND_TIME_EXPIRED
        raise ArgumentError, "Missing query"
      end

      internal_find_query_string(type, "", 0)
    end
  end
end
