# frozen_string_literal: true

gem_install 'overcommit'

after_bundle do
  run 'overcommit --install'
  copy_file 'templates/.overcommit.yml', '.overcommit.yml', force: true
end
