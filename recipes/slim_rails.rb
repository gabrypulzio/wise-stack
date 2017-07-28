# frozen_string_literal: true

gem_latest_version 'slim-rails'

gem_install 'html2slim'
say_info 'converting erb to slim'
run 'erb2slim app/views/layouts -d'
