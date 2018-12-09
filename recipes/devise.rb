# frozen_string_literal: true

if yes_install_gem? 'devise'
  gem_latest_version 'devise'
  gem_latest_version 'devise-i18n'
  generate 'devise:install'
end
