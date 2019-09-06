sidekiq_url = { url: ENV['REDISTOGO_URL'] }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_url
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_url
end
