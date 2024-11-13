source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3'

gem 'rails', '~> 8'
gem 'pg', '~> 1'
gem 'puma', '~> 6'
gem 'propshaft'
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'redis', '~> 5'
gem 'sidekiq'
# gem 'image_processing', '~> 1'
gem 'aws-sdk-s3', require: false
gem 'active_storage_validations'
gem 'bootsnap', '~> 1', require: false
gem 'bootstrap_form'
gem 'ahoy_matey'
gem 'bcrypt', '~> 3'
gem 'scrypt', '~> 3'
gem 'skylight'
gem 'sentry-rails'
gem 'net-smtp'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'brakeman', require: false
  gem 'rubocop-rails-omakase', require: false
end

group :development do
  gem 'web-console'
  gem 'pry-rails'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'dockerfile-rails'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
