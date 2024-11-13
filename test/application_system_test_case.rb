require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV['CI'] == 'true'
    driven_by :selenium_chrome_headless, using: :chrome, screen_size: [1400, 1400]
  else
    driven_by :selenium, using: :firefox, screen_size: [1400, 1400]
  end
end
