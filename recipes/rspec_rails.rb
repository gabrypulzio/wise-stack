# frozen_string_literal: true

add_to_gem_group :development, :test do
  gem_latest_version 'rspec-rails'
end

after_bundle do
  generate 'rspec:install'
end
