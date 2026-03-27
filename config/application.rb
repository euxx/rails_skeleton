require_relative "boot"
require_relative "../app/middleware/bot_filter"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RailsSkeleton
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    config.exceptions_app = self.routes

    config.time_zone = 'Beijing'

    # Insert BotFilter before Skylight so bot requests never reach Skylight's
    # middleware and aren't counted against the free-tier usage quota.
    # Skip in test environment: Selenium/headless Chrome UA would be blocked.
    unless Rails.env.test?
      config.middleware.insert_before 0, BotFilter
      config.skylight.middleware_position = { after: BotFilter }
    end
  end
end
