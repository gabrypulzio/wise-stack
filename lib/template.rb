# frozen_string_literal: true

RAILS_MINIMUM_VERSION = '5.2.4'

def assert_minimum_rails_version
  minimum_rails_version = Gem::Version.new(RAILS_MINIMUM_VERSION)
  current_rails_version = Gem::Version.new(Rails::VERSION::STRING)
  return if current_rails_version >= minimum_rails_version

  say_error "This template needs rails version #{RAILS_MINIMUM_VERSION}, you are using rails "\
    "version #{current_rails_version}. Please update rails"
  exit 1
end

def apply_recipe(recipe)
  say_recipe recipe
  apply "recipes/#{recipe}.rb"
end

# handles gem_groups in a buffer so that we can print them grouped in Gemfile at the end of
# the template execution.
def add_to_gem_group(*names, &block)
  name = names.map(&:inspect).join(', ')
  @gem_groups_buffer ||= {}
  @gem_groups_buffer[name] ||= []
  @gem_groups_buffer[name] << block
end

# inject into Gemfile all the gem groups buffered.
def update_gemfile
  in_root do
    first_group = true
    @gem_groups_buffer.sort.each do |group, blocks|
      log :gemfile, "group #{group}"
      if first_group
        append_file 'Gemfile', "\n", force: true
        first_group = false
      end
      append_file 'Gemfile', "\ngroup #{group} do", force: true
      @in_group = true
      blocks.each { |block| instance_eval(&block) }
      @in_group = false
      append_file 'Gemfile', "\nend\n", force: true
    end
  end
end

def load_default_answers
  @default_answers = YAML.safe_load(
    File.open(File.expand_path('../default_answers.yml', __dir__))
  ) || {}
end
