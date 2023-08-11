# frozen_string_literal: true

# Copyright (c) 2023 Maxim [maxirmx] Samsonov (https://sw.consulting)
# All rights reserved.
# This file is a part of rucades

# rubocop:disable Metrics/BlockLength
RSpec.describe Rucades do
  it "has a version number" do
    expect(Rucades::VERSION).not_to be nil
  end

  # Version cades object is an entity that you are not supposed to create directly
  # If created this way it reports random values, so we just check that methods exist
  it "has Version class" do
    v = Version.new
    v.to_s
    v.major_version
    v.minor_version
    v.build_version
  end

  # This is the real version
  # It may change so we test it for consistency
  it "has a real version available through About class" do
    a = About.new
    v = a.version
    puts "\t\tSDK version: #{v}"
    i = v.split(".")
    expect(a.major_version).to eq(i[0].to_i)
    expect(a.minor_version).to eq(i[1].to_i)
    expect(a.build_version).to eq(i[2].to_i)
  end

  it "has plugin version available through About class" do
    a = About.new
    pv = a.plugin_version.to_s
    puts "\t\tPlugin version: #{pv}"
    i = pv.split(".")
    expect(a.plugin_version.major_version).to eq(i[0].to_i)
    expect(a.plugin_version.minor_version).to eq(i[1].to_i)
    expect(a.plugin_version.build_version).to eq(i[2].to_i)
  end

  it "has CSP version available through About class" do
    a = About.new
    pv = a.csp_version.to_s
    puts "\t\tCSP version: #{pv}"
    i = pv.split(".")
    expect(a.csp_version.major_version).to eq(i[0].to_i)
    expect(a.csp_version.minor_version).to eq(i[1].to_i)
    expect(a.csp_version.build_version).to eq(i[2].to_i)
  end

  it "handles version-related exceptions" do
    a = About.new
    expect { a.csp_version "foo", 99 }.to raise_error(RuntimeError)
  end
end
# rubocop:enable Metrics/BlockLength
