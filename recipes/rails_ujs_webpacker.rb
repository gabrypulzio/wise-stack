# frozen_string_literal: true

after_bundle do
  run 'yarn add rails-ujs'

  unless rails_6?
    append_to_file 'app/webpacker/packs/application.js', "require('rails-ujs').start();"
  end
end
