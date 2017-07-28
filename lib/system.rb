# frozen_string_literal: true

require 'open3'

def binary_installed?(binary_name)
  _, _, _, wait_thr = Open3.popen3("which #{binary_name}")
  wait_thr.value.success?
end
