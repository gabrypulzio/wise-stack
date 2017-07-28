# frozen_string_literal: true

gem_latest_version 'secure_headers'

after_bundle do
  copy_file 'templates/secure_headers.rb', 'config/initializers/secure_headers.rb'
  say_warning 'Please review config/initializers/secure_headers.rb configuration after install!!!'
end
