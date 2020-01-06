# frozen_string_literal: true

require 'open3'
require 'English'

def binary_installed?(binary_name)
  _, _, _, wait_thr = Open3.popen3("which #{binary_name}")
  wait_thr.value.success?
end

def rails_command_with_errors_handling(command)
  rails_command command
  return if $CHILD_STATUS.success?

  say_error 'An error was detected. See the output written before.'
  exit(1)
end
