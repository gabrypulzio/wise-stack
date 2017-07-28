# frozen_string_literal: true

after_bundle do
  copy_file 'templates/.gitignore', '.gitignore', force: true
end
