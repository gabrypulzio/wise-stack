# frozen_string_literal: true

gem_install 'rubocop'

after_bundle do
  if File.exist? File.expand_path('~/.rubocop.yml')
    say_info 'using user .rubocop.yml file located at ~/.rubocop.yml'
  else
    say_info 'downloading .rubocop.yml'
    get 'https://gist.githubusercontent.com/gabrypulzio/892dbb0bae11048da89772fcb109705c/raw/5a39c628d3e274140a973aa4d0af7baa0ab65da8/.rubocop.yml'
  end
  run 'rubocop -a --fail-level A > /dev/null'
end
