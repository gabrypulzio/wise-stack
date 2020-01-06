# frozen_string_literal: true

after_bundle do
  run 'yarn add rails-ujs'

  append_to_file 'app/webpacker/packs/application.js' do
    <<~CODE
      const Rails = require('rails-ujs');
      Rails.start();
    CODE
  end
end
