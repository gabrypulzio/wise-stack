# frozen_string_literal: true

require_relative '../lib/bootstrap/bootstrap'

return unless yes_install_yarn_package? 'bootstrap'

install_boostrap_webpacker
install_bootstrap_helpers
