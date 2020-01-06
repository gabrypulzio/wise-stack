# frozen_string_literal: true

# remove webpacker gem wrote by rails generator
gsub_file 'Gemfile', /# Transpile app-like JavaScript. .*/, ''
gsub_file 'Gemfile', /gem 'webpacker'.*/, ''
gem_latest_version 'webpacker'

after_bundle do
  rails_command_with_errors_handling 'webpacker:install'
  run 'yarn upgrade'

  # use a better name for webpacker root directory
  gsub_file 'config/webpacker.yml', '  source_path: app/javascript', '  source_path: app/webpacker'
  gsub_file 'config/webpacker.yml', '  extract_css: false', '  extract_css: true'
  FileUtils.mv 'app/javascript', 'app/webpacker'
  FileUtils.mkdir_p 'app/webpacker/src/javascripts'
  FileUtils.mkdir_p 'app/webpacker/src/stylesheets'
  FileUtils.touch 'app/webpacker/packs/stylesheets.scss'
end
