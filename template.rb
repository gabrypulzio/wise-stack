# frozen_string_literal: true

require_relative 'lib/template'
require_relative 'lib/console'
require_relative 'lib/gem'
require_relative 'lib/yarn'
require_relative 'lib/system'

def source_paths
  [__dir__]
end

load_default_answers
assert_minimum_rails_version
apply 'recipes.rb'
