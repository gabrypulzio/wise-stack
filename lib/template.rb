# frozen_string_literal: true

RAILS_MINIMUM_VERSION = "5.1.0".freeze

def assert_minimum_rails_version
  minimum_rails_version = Gem::Version.new(RAILS_MINIMUM_VERSION)
  current_rails_version = Gem::Version.new(Rails::VERSION::STRING)
  return if current_rails_version >= minimum_rails_version
  say_error "This template needs rails version #{RAILS_MINIMUM_VERSION}, you are using rails version #{current_rails_version}. Please update rails"
  exit 1
end

def apply_recipe(recipe)
  say_recipe recipe
  apply "recipes/#{recipe}.rb"
end
