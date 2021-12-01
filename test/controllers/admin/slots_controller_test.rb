require 'test_helper'

class Admin::SlotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_slots_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_slots_index_url
    assert_response :success
  end

end
