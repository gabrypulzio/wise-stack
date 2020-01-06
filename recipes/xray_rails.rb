# frozen_string_literal: true

if rails_6?
  say_warning 'xray_rails current disabled on rails 6 until '\
              'https://github.com/brentd/xray-rails/pull/103 is merged in a stable version.'
  return
end

add_to_gem_group :development, :test do
  gem_latest_version 'xray-rails'
end
