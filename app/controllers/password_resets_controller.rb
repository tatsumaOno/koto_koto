class PasswordResetsController < ApplicationController
  before_action :find_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:warning] = "パスワードリセットメールを送りました。ご確認ください。"
      redirect_to root_path
    else
      flash.now[:danger] = '無効なメールアドレスです'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, :blank)
      render :edit
    elsif @user.update_attributes(reset_params)
      log_in @user
      flash[:success] = "パスワードを設定しました"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def find_user
    @user = User.find_by(email: params[:email])
  end

  # 有効なユーザーか確認
  def valid_user
    unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
      redirect_to root_path
    end
  end

  def check_expiration
    redirect_to new_password_reset_path if @user.password_reset_expired?
  end
end
