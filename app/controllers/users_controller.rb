class UsersController < ApplicationController
  before_action :logged_in_user,only: [:edit,:update] 
  before_action :correct_user,only: [:show,:edit,:update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(new_user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      #有効化
      flash[:warning] = "メールをご確認して有効にしてください"
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(edit_user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end


  private

    def new_user_params
      params.require(:user).permit(:name,:nickname,:email,:password,:password_confirmation)
    end

    def edit_user_params
      params.require(:user).permit(:name,:nickname,:email,:introduction)
    end

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless @user == current_user
    end
end
