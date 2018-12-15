# frozen_string_literal: true

return unless yes_install_gem? 'bootstrap'

gem_latest_version 'bootstrap'
gem_latest_version 'jquery-rails'

append_to_file 'app/assets/stylesheets/application.scss' do
  <<~CODE
    @import "bootstrap";
  CODE
end
insert_into_file 'app/assets/javascripts/application.js', before: '//= require rails-ujs' do
  <<~CODE
    //= require jquery
    //= require popper
    //= require bootstrap-sprockets
  CODE
end
copy_file 'templates/bootstrap/helpers/bootstrap_helper.rb',
          'app/helpers/bootstrap_helper.rb', force: true
copy_file 'templates/bootstrap/helpers/gui_helper.rb',
          'app/helpers/gui_helper.rb', force: true
if yep? 'install a basic bootstrap layout?'
  after_bundle do
    copy_file 'templates/bootstrap/assets/stylesheets/application.scss',
              'app/assets/stylesheets/application.scss', force: true
    copy_file 'templates/bootstrap/layout/application.html.slim',
              'app/views/layouts/application.html.slim', force: true
    copy_file 'templates/bootstrap/layout/_navbar.html.slim',
              'app/views/layouts/_navbar.html.slim', force: true
  end
end
