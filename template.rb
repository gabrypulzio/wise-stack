# frozen_string_literal: true

require_relative 'lib/template'
require_relative 'lib/console'
require_relative 'lib/gem'
require_relative 'lib/system'


def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

assert_minimum_rails_version
apply 'recipes.rb'
