# frozen_string_literal: true

def install_boostrap_webpacker
  run 'yarn add jquery popper.js bootstrap'
  after_bundle do
    copy_file 'templates/bootstrap/config/webpack/environment.js',
              'config/webpack/environment.js', force: true
    append_to_file 'app/webpacker/packs/application.js', "import 'bootstrap';"
    append_to_file 'app/webpacker/packs/application.scss', "@import '~bootstrap/scss/bootstrap';"
    application_layout = 'app/views/layouts/application.html.erb'
    gsub_file application_layout, 'stylesheet_link_tag', 'stylesheet_pack_tag'
    gsub_file application_layout, 'width=device-width,initial-scale=1',
              'width=device-width,initial-scale=1,shrink-to-fit=no'
    insert_into_file application_layout, after: '<body>' do
      "\n    <%= bootstrap_flash %>"
    end
  end
end

def install_boostrap_layout_webpacker
  after_bundle do
    copy_file 'templates/bootstrap/webpack/stylesheets/application.scss',
              'app/webpacker/packs/application.scss', force: true
    copy_file 'templates/bootstrap/layout/application_webpack.html.slim',
              'app/views/layouts/application.html.slim', force: true
    copy_file 'templates/bootstrap/layout/_navbar.html.slim',
              'app/views/layouts/_navbar.html.slim', force: true
  end
end

def install_bootstrap_helpers
  copy_file 'templates/bootstrap/helpers/bootstrap_helper.rb',
            'app/helpers/bootstrap_helper.rb', force: true
end
