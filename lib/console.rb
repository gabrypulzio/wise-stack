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
  yep?("Install '#{gem_name}' gem?")
end

def yep?(question)
  yes? info_text("#{default_message_string} #{question}")
end
