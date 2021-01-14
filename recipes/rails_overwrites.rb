# frozen_string_literal: true

inject_into_class 'config/application.rb', 'Application' do
  <<-CODE
    config.generators do |g|
      g.scaffold_stylesheet false
      g.assets false
      g.helper false
      g.stylesheets false
      g.jbuilder false
    end
  CODE
end

FileUtils.rm 'app/assets/stylesheets/application.css'
FileUtils.touch 'app/assets/stylesheets/application.scss'
