# frozen_string_literal: true

require 'net/http'
require 'json'
require 'yaml'

# get current gem version installed on system (so it doesn't use bundler)
def current_gem_version(gem_name)
  _, stdout, stderr, wait_thr = Open3.popen3("gem specification #{gem_name}")
  raise "Error while getting infos for gem #{gem_name}: #{stderr.read}" unless
    wait_thr.value.success?

  YAML.safe_load(stdout, [Gem::Specification, Gem::Version, Time, Gem::Dependency,
                          Gem::Requirement, Symbol]).version
end

# install gem if not installed on system (it doesn't use bundler). Optionally
# upgrades gem if older
def gem_install(gem_name, upgrade_if_old: true)
  if gem_installed?(gem_name)
    latest_version = get_gem_latest_version(gem_name)
    current_version = current_gem_version(gem_name)
    if upgrade_if_old && latest_version > current_version
      say_info "upgrading system gem #{gem_name} version: #{current_version.version} -> "\
        "#{latest_version.version}"
      `gem install #{gem_name}`
    end
  else
    `gem install #{gem_name}`
  end
end

# check if gem is installed
def gem_installed?(gem_name, use_bundle = false)
  bundle_cmd = ''
  bundle_cmd = 'bundle exec ' if use_bundle
  `#{bundle_cmd}gem list -i #{gem_name}`.include? 'true'
end

# check if gems needed by recipe are installed
def assert_gem_dependency_for(recipe, gem_names)
  Array(gem_names).each do |gem_name|
    unless gem_installed?(gem_name, true)
      say_warning "#{gem_name} need to be installed to use '#{recipe}' recipe"
      return false
    end
  end
  true
end

# inject gem into Gemfile using '~>' convention, with its latest version explicited
def gem_latest_version(gem_name, args = {})
  gem gem_name, "~> #{get_gem_latest_version(gem_name)}", args
end

def gem_latest_version_if_yes(gem_name)
  gem_latest_version gem_name if yes_install_gem?(gem_name)
end

def gem_if_yes(gem_name)
  gem gem_name if yes_install_gem? gem_name
end

# fetch gem latest version from rubygems
def get_gem_latest_version(gem_name)
  json = JSON.parse(Net::HTTP.get(URI("https://rubygems.org/api/v1/versions/#{gem_name}/"\
    'latest.json')))
  version = json['version']
  return Gem::Version.new(version) if version && version != 'unknown'

  say_error "Unable to find valid version for gem '#{gem_name}'."
  exit(1)
rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, SocketError,
       Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
  say_error "Unable to find latest version for gem '#{gem_name}', error: #{e.message}"
  exit(1)
end

def rails_6?
  Gem::Version.new(Rails::VERSION::STRING) >= Gem::Version.new('6.0.0')
end
