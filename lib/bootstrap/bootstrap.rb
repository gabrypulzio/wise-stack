# frozen_string_literal: true

def install_bootstrap_asset_pipeline
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

  return unless yep? 'Install a basic bootstrap layout?'

  install_boostrap_layout_asset_pipeline
end

def install_boostrap_webpacker
  run 'yarn add jquery popper.js bootstrap'
  after_bundle do
    copy_file 'templates/bootstrap/config/webpack/environment.js',
              'config/webpack/environment.js', force: true
    append_to_file 'app/webpacker/packs/application.js', "import 'bootstrap';"
    append_to_file 'app/webpacker/packs/stylesheets.scss', "@import '~bootstrap/scss/bootstrap';"
  end
  return unless yep? 'Install a basic bootstrap layout?'

  install_boostrap_layout_webpacker
end

def install_boostrap_layout_asset_pipeline
  after_bundle do
    copy_file 'templates/bootstrap/assets/stylesheets/application.scss',
              'app/assets/stylesheets/application.scss', force: true
    copy_file 'templates/bootstrap/layout/application.html.slim',
              'app/views/layouts/application.html.slim', force: true
    copy_file 'templates/bootstrap/layout/_navbar.html.slim',
              'app/views/layouts/_navbar.html.slim', force: true
  end
end

def install_boostrap_layout_webpacker
  after_bundle do
    copy_file 'templates/bootstrap/webpack/stylesheets/application.scss',
              'app/webpacker/packs/stylesheets.scss', force: true
    copy_file 'templates/bootstrap/layout/application_webpack.html.slim',
              'app/views/layouts/application.html.slim', force: true
    copy_file 'templates/bootstrap/layout/_navbar.html.slim',
              'app/views/layouts/_navbar.html.slim', force: true
  end
end

def install_bootstrap_helpers
  copy_file 'templates/bootstrap/helpers/bootstrap_helper.rb',
            'app/helpers/bootstrap_helper.rb', force: true
  copy_file 'templates/bootstrap/helpers/gui_helper.rb',
            'app/helpers/gui_helper.rb', force: true
end
