require "application_system_test_case"

class ErrorsTest < ApplicationSystemTestCase
  test "visit 404 page" do
    visit '404'
    assert_text '404'
  end

  test "visit 422 page" do
    visit '422'
    assert_text '422'
  end

  test "visit 500 page" do
    visit '500'
    assert_text '500'
  end
end
