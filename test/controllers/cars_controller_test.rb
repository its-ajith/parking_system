# frozen_string_literal: true

require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get cars_new_url
    assert_response :success
  end

  test 'should get show' do
    get cars_show_url
    assert_response :success
  end
end
