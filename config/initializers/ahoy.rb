class Ahoy::Store < Ahoy::DatabaseStore
end

# set to true for JavaScript tracking
Ahoy.api = false

Ahoy.track_bots = true
Ahoy.cookie_domain = :all
Ahoy.visit_duration = 6.hours

IPS = %w[192.168.1.1]
Ahoy.exclude_method = lambda do |controller, request|
  request.ip.in?(IPS)
end
