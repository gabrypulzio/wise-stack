# frozen_string_literal: true

require 'json'

def yarn_package_installed?(package)
  return false unless File.exist?('package.json')

  json = JSON.parse(File.read('package.json'))
  json['dependencies'] && json['dependencies'][package].present?
end
