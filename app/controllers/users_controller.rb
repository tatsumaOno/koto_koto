class UsersController < ApplicationController
  before_action :logged_in_user,only: [:edit,:update,:discord] 
  before_action :correct_user,only: [:show,:edit,:update,:discord,:destroy]

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
    @demand_services = @user.services.where(work: "demand")
    @supply_services = @user.services.where(work: "supply")
    @rooms = @user.rooms
  end

  def edit
  end

  def update
    if @user.update(edit_user_params)
      if @card = Card.find_by(user_id: @user.id)
        @customer = Card.set_customer(@card)
        @customer.email = @user.email
        @customer.save
      end
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render :edit
    end
  end

  def discard #退会機能
  end

  def destroy
    log_out if logged_in?
    if @card = Card.find_by(user_id: @user.id)
      @customer = Card.set_customer(@card)
      @card.delete_payjp(@customer)
    end
    @user.destroy
    flash[:alert] = "退会しました"
    redirect_to root_path
  end


  private

    def new_user_params
      params.require(:user).permit(:name,:nickname,:email,:password,:password_confirmation)
    end

    def edit_user_params
      params.require(:user).permit(:name,:nickname,:email,:introduction,:image)
    end
end
