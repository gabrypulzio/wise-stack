# frozen_string_literal: true

return unless yep? 'Install a basic user dashboard?'

after_bundle do
  if assert_gem_dependency_for 'basic_user_dashboard', 'devise'
    generate 'devise User'
    generate 'devise:views' if gem_installed?('simple_form', true)
    generate 'controller dashboard show'
    rails_command "db:migrate"

    insert_into_file 'config/routes.rb', before: 'end' do
      "  root to: 'dashboard#show'"
    end
    insert_into_file 'app/controllers/application_controller.rb',
                     after: 'class ApplicationController < ActionController::Base' do
      "\n  before_action :authenticate_user!"
    end
  end
end
