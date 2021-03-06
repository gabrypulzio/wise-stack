# frozen_string_literal: true

return unless yes_install_gem? 'slim-rails'

gem_latest_version 'slim-rails'

gem_install 'html2slim'
say_info 'converting erb to slim'
run 'erb2slim app/views/layouts -d'

after_bundle do
  copy_file 'templates/slim.rb', 'config/initializers/slim.rb'
end
