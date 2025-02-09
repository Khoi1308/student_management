require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get homw' do
    get pages_homw_url

    assert_response :success
  end
end
