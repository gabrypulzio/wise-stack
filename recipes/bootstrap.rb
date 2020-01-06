# frozen_string_literal: true

require_relative '../lib/bootstrap/bootstrap'

return unless yes_install_gem? 'bootstrap'

if gem_installed? 'webpacker'
  install_boostrap_webpacker
else
  install_bootstrap_asset_pipeline
end
install_bootstrap_helpers
