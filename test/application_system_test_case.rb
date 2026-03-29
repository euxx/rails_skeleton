require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV['CI'] == 'true'
    Capybara.default_max_wait_time = 10
    driven_by :selenium_chrome_headless, using: :chrome, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :firefox, screen_size: [1400, 1400]
  end
end
