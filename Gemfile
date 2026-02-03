# frozen_string_literal: true

source "https://rubygems.org"

eval_gemfile "Gemfile.devtools"

gemspec

unless ENV["CI"]
  gem "yard", require: false
end

gem "hanami-devtools", require: false, github: "hanami/devtools"
gem "i18n", "~> 1.0",  require: false

group :test do
  gem "rspec", "~> 3.9"
end
