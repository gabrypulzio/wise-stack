# frozen_string_literal: true

return unless yes_install_gem? 'simple_form'

gem_latest_version 'simple_form'

after_bundle do
  options = '--bootstrap' if gem_installed?('bootstrap', true)
  generate 'simple_form:install', options
end
