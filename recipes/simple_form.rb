# frozen_string_literal: true

gem_latest_version 'simple_form'

after_bundle do
  options = '--bootstrap' if gem_installed?('bootstrap', true)
  generate 'simple_form:install', options
end
