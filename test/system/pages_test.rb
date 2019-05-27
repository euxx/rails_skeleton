require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit home_page_path
    assert_text 'Hello, Stimulus!'

    find('span', text: 'Popover').click
    assert_text "I'm OK"
  end
end
