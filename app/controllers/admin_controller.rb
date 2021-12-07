# frozen_string_literal: true

# AdminController
class AdminController < ApplicationController
  before_action :authenticate_user

  def authenticate_user
    redirect_to '/admin/home/index' if current_user.nil?
  end
end
