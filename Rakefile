# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

require "rake/extensiontask"

task build: :compile
task spec: :compile

Rake::ExtensionTask.new("rucades") do |ext|
  ext.lib_dir = "lib/rucades"
end

task default: %i[compile spec rubocop]
