require 'test_helper'

class DoctorsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get doctors_edit_url
    assert_response :success
  end

  test "should get show" do
    get doctors_show_url
    assert_response :success
  end

end
