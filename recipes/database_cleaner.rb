# frozen_string_literal: true

gem_group :test do
  gem_latest_version 'database_cleaner'
end

after_bundle do
  insert_into_file 'spec/spec_helper.rb', after: 'RSpec.configure do |config|' do
    <<-CODE.gsub(/^\s+\|/, '')
      |
      |  config.before(:suite) do
      |    DatabaseCleaner.strategy = :transaction
      |    DatabaseCleaner.clean_with(:truncation)
      |  end
      |
      |  config.around(:each) do |example|
      |    DatabaseCleaner.cleaning do
      |      example.run
      |    end
      |  end
    CODE
  end
end
