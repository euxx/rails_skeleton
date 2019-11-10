SENTRY_ENVIRONMENTS = %w[staging production]

if Rails.env.in?(SENTRY_ENVIRONMENTS)
  Raven.configure do |config|
    config.dsn = Rails.application.credentials.sentry_dsn
    config.excluded_exceptions = []
    config.environments = SENTRY_ENVIRONMENTS
    config.processors -= [Raven::Processor::Cookies]
    config.processors -= [Raven::Processor::PostData]
    config.async = ->(event) { SentryJob.perform_later(event) }
    config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
  end
end
