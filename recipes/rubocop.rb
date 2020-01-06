# frozen_string_literal: true

add_to_gem_group :development do
  gem_latest_version 'rubocop', require: false
end

after_bundle do
  copy_template_rubocop = true
  if File.exist? File.expand_path('~/.rubocop.yml')
    unless yep? 'Install template rubocop.yml file? (if not, the user ~/.rubocop.yml will be used)'
      say_info 'Using user .rubocop.yml file located at ~/.rubocop.yml'
      copy_template_rubocop = false
    end
  end
  copy_file 'templates/.rubocop.yml', '.rubocop.yml' if copy_template_rubocop
end
