# frozen_string_literal: true

return unless yep? 'install a basic user dashboard?'

assert_gem_dependency_for 'basic_user_dashboard', 'devise'

after_bundle do
  generate 'devise User'
  generate 'devise:views' if gem_installed?('simple_form', true)
  generate 'controller dashboard show'

  insert_into_file 'config/routes.rb', before: 'end' do
    "  root to: 'dashboard#show'"
  end
  insert_into_file 'app/controllers/application_controller.rb',
                   after: 'class ApplicationController < ActionController::Base' do
    "\n  before_action :authenticate_user!"
  end
end
