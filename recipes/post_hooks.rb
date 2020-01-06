# frozen_string_literal: true

update_gemfile

after_bundle do
  say_info 'Autocorrect files with rubocop'
  run 'bundle exec rubocop -a --fail-level A > /dev/null'
  say_info 'Removing all trailing spaces from files...'
  run 'find -E . -type d -name .git -prune -o -type f -regex '\
      "'.*\.(rb|txt|css|md|scss|yml|coffee|slim|erb)' -print0 | xargs -0 "\
      "sed -i '' -e 's/[[:space:]]*$//'"
end
