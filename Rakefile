# frozen_string_literal: true

require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "rubocop/rake_task"

RSpec::Core::RakeTask.new(:spec)

desc "Run all tests"
task test: :spec

RuboCop::RakeTask.new(:rubocop)

desc "Run all linters"
task lint: :rubocop

task default: %i[lint test]
