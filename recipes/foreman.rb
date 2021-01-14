# frozen_string_literal: true

gem_install 'foreman'

after_bundle do
  copy_file 'templates/foreman/Procfile', 'Procfile', force: true
end
