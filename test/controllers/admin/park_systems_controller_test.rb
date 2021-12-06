# frozen_string_literal: true

require 'test_helper'

class Admin::ParkSystemsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get admin_park_systems_new_url
    assert_response :success
  end

  test 'should get show' do
    get admin_park_systems_show_url
    assert_response :success
  end
end
