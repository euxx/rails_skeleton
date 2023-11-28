require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by ENV['CI'] == 'true' ? :selenium_chrome_headless : :selenium, using: :chrome, screen_size: [1400, 1400]
end
