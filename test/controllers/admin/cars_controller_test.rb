# frozen_string_literal: true

require 'test_helper'

class Admin::CarsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get admin_cars_new_url
    assert_response :success
  end
end
