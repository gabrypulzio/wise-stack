# frozen_string_literal: true

apply_recipe 'webpacker'
apply_recipe 'rails_ujs_webpacker'
apply_recipe 'rails_overwrites'
# NOTE: bootstrap recipe should be invoked before simple_form to use bootstrap layout when
#       installing simple_form
apply_recipe 'bootstrap'
apply_recipe 'awesome_print'
apply_recipe 'better_errors'
apply_recipe 'brakeman'
apply_recipe 'bundler_audit'
apply_recipe 'devise'
apply_recipe 'git'
apply_recipe 'overcommit'
apply_recipe 'pry_rails'
apply_recipe 'factory_bot_rails'
apply_recipe 'rspec_rails'
apply_recipe 'database_cleaner' # must run after rspec_rails
apply_recipe 'rubocop'
apply_recipe 'simple_form'
apply_recipe 'slim_rails'
apply_recipe 'mini_racer'
apply_recipe 'xray_rails'
apply_recipe 'basic_user_dashboard'

# template post hooks
apply_recipe 'post_hooks'
