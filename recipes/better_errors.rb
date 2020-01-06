# frozen_string_literal: true

add_to_gem_group :development do
  gem_latest_version 'better_errors'
  gem_latest_version 'binding_of_caller'

  create_file 'config/initializers/better_errors.rb' do
    info_message = 'Configuring %s for better errors, make sure you have a valid handler installed.'
    if binary_installed? 'subl'
      say_info info_message % 'Sublime Text'
      editor = ':sublime'
    elsif binary_installed? 'atom'
      say_info info_message % 'Atom'
      editor = 'atm://open?url=file://%<file>s&line=%<line>s'
    end
    if editor
      <<~CODE
        BetterErrors.editor = "#{editor}" if defined?(BetterErrors)
      CODE
    else
      <<~CODE
        # Preset values are [:mvim, :macvim, :textmate, :txmt, :tm, :sublime, :subl, :st]
        # BetterErrors.editor = :mvim
      CODE
    end
  end
end
