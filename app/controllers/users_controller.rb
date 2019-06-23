class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(user_params)
  end





  private
    def user_params
    end
end
