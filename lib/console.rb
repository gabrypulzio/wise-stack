# frozen_string_literal: true

def default_message_string
  '-`ღ´-'
end

def colorize(text, color_code)
  "\x1b[38;5;#{color_code}m#{text}\x1b[0m"
end

def info_text(text)
  colorize text, 147
end

def error_text(text)
  colorize text, 197
end

def recipe_text(text)
  colorize text, 213
end

def warning_text(text)
  colorize text, 226
end

def say_recipe(recipe)
  say recipe_text("#{default_message_string} Running #{recipe} recipe...")
end

def say_info(info)
  say info_text "#{default_message_string} #{info}"
end

def say_warning(warning)
  say warning_text "#{default_message_string} /!\\ #{warning}"
end

def say_error(error)
  say error_text "#{default_message_string} #{error}"
  exit(1)
end

def yes_install_gem?(gem_name)
  yes_install_element?(gem_name, 'gem')
end

def yes_install_yarn_package?(package_name)
  yes_install_element?(package_name, 'yarn package')
end

def yes_install_element?(element, type)
  question = "Install '#{element}' #{type}?"
  default_answer = default_answer?(question)
  if default_answer.nil?
    yep?(question)
  else
    say_info "Default answer for #{type} install #{element}: #{default_answer ? 'Yes' : 'No'}"
    default_answer
  end
end

def yep?(question)
  default_answer = default_answer?(question)
  if default_answer.nil?
    yes? info_text("#{default_message_string} #{question}")
  else
    say_info "Default answer for #{question}: #{default_answer ? 'Yes' : 'No'}"
    default_answer
  end
end

def default_answer?(question)
  @default_answers.fetch(question, nil)
end
