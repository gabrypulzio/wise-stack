# frozen_string_literal: true

# Please review this configuration for your needs. This configuration is not meant to
# be the safest but just to have a minimal configuration to have secure_headers working
# See https://github.com/twitter/secureheaders#configuration for more options
SecureHeaders::Configuration.default do |config|
  config.csp = {
    default_src: %w('self' localhost:* ws://localhost:*),
    font_src: %w('self'),
    img_src: %w('self' data:),
    object_src: %w('none'),
    script_src: %w('self' 'unsafe-inline' localhost:*),
    style_src: %w('self' 'unsafe-inline')
  }
end
