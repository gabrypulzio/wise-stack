# frozen_string_literal: true

gem_install 'overcommit'

after_bundle do
  copy_file 'templates/.overcommit.yml', '.overcommit.yml', force: true
  run 'overcommit --install'
end
