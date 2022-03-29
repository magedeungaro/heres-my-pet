Sentry.init do |config|
  # config.environment = 'production'
  config.environment = 'development'
  config.dsn = 'https://8e026e710ec84787b839f5fe8061f756@o1181011.ingest.sentry.io/6294033'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
