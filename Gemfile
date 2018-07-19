source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'cocoon', '~> 1.2', '>= 1.2.11'
gem 'coffee-rails', '~> 4.2'
gem 'factory_bot'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'paperclip', '~> 6.0.0'
gem 'paperclip-dimension-validator'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'reek'
gem 'rubocop', '0.46.0'
gem 'rubocop-rspec', '1.8.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails', '~> 4.0'
gem 'uglifier', '>= 1.3.0'

group :development, :test, :production do
  gem 'aws-sdk'
  gem 'factory_bot_rails'
end

group :development, :test do
  gem 'byebug', platforms: %i(mri mingw x64_mingw)
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'pry', '~> 0.11.3'
  gem 'rspec-rails', '~> 3.6'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.16'
  gem 'chromedriver-helper'
  gem 'database_cleaner', '~> 1.6.2'
  gem 'selenium-webdriver'
end

gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)
