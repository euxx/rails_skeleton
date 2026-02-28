require 'test_helper'

class ErrorsNavigationTest < ActionDispatch::IntegrationTest
  test 'error page back link falls back to root for external referer' do
    get '/404', headers: { 'HTTP_REFERER' => 'https://evil.example/phish' }

    assert_response :not_found
    assert_select "a.btn[href='#{root_path}']", text: '返回上一页面，或回到主页'
  end

  test 'error page back link keeps path for same-host referer' do
    get '/404', headers: { 'HTTP_REFERER' => 'http://www.example.com/sign_in?from=404' }

    assert_response :not_found
    assert_select "a.btn[href='/sign_in?from=404']", text: '返回上一页面，或回到主页'
  end
end
