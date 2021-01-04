source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7'

gem 'rails', '~> 6.1'
gem 'pg', '~> 1'
gem 'puma', '~> 5'
gem 'webpacker', '~> 5'
gem 'turbolinks', '~> 5'
gem 'jbuilder'
gem 'redis', '~> 4'
gem 'sidekiq'
# gem 'image_processing', '~> 1'
gem 'aws-sdk-s3', require: false
gem 'active_storage_validations'
gem 'bootsnap', '~> 1', require: false
gem 'bootstrap_form'
gem 'ahoy_matey'
gem 'authlogic', '~> 6'
gem 'scrypt', '~> 3'
gem 'skylight'
gem 'sentry-raven'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console'
  gem 'pry-rails'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
