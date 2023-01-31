SENTRY_ENVIRONMENTS = %w[staging production]

if Rails.env.in?(SENTRY_ENVIRONMENTS)
  Sentry.init do |config|
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
    config.dsn = Rails.application.credentials.sentry_dsn
    config.enabled_environments = SENTRY_ENVIRONMENTS
    config.send_default_pii = true
    config.sample_rate = 1.0
    config.traces_sample_rate = 1.0
  end
end
