# frozen_string_literal: true

require "i18n"
require "pathname"
SPEC_ROOT = Pathname.new(__dir__)

require "hanami/validations"

require_relative "support/rspec"
SPEC_ROOT.glob("support/**/*.rb").each { |f| require(f) }
