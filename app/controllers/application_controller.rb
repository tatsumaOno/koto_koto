class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'payjp'
  include SessionsHelper
  include UsersHelper

  private

  def logged_in_user
    redirect_to(login_path) unless logged_in?
  end

  def correct_user
    @user = User.find(current_user.id)
    redirect_to(root_path) unless @user
  end
end
