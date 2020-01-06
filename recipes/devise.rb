# frozen_string_literal: true

return unless yes_install_gem? 'devise'

gem_latest_version 'devise'
gem_latest_version 'devise-i18n'
after_bundle do
  generate 'devise:install'
end
