# frozen_string_literal: true

after_bundle do
  gsub_file 'config/webpacker.yml', '  source_path: app/javascript', '  source_path: app/webpacker'
  gsub_file 'config/webpacker.yml', '  extract_css: false', '  extract_css: true'
  FileUtils.mv 'app/javascript', 'app/webpacker'
  FileUtils.mkdir_p 'app/webpacker/src/javascripts'
  FileUtils.mkdir_p 'app/webpacker/src/stylesheets'
  FileUtils.touch 'app/webpacker/packs/application.scss'
end
