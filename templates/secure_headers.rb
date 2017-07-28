# frozen_string_literal: true

# Please review this configuration for your needs. This configuration is not meant to
# be the safest but just to have a minimal configuration to have secure_headers working
# See https://github.com/twitter/secureheaders#configuration for more options
SecureHeaders::Configuration.default do |config|
  config.hsts = "max-age=#{20.years.to_i}"
  config.x_frame_options = 'SAMEORIGIN'
  config.x_xss_protection = '1; mode=block'
  config.x_content_type_options = 'nosniff'
  config.x_download_options = SecureHeaders::OPT_OUT
  config.x_permitted_cross_domain_policies = 'none'
  config.csp = SecureHeaders::OPT_OUT
  config.hpkp = SecureHeaders::OPT_OUT
end
