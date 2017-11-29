# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  config.around do |example|
    DatabaseCleaner.cleaning { example.run }
  end
end
