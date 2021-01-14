# frozen_string_literal: true

gem_latest_version 'secure_headers'

after_bundle do
  copy_file 'templates/secure_headers.rb', 'config/initializers/secure_headers.rb'
  say_warning 'Installed Secure Headers configuration (config/initializers/secure_headers.rb) is '\
    "insecure and it's meant to have everything working in a development environment, "\
    'you must configure it with your custom needs before going to production!!!'
end
