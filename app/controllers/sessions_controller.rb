class SessionsController < ApplicationController
  def new
  end

  #ログイン
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #authenticateでuserを確認
      if user.activated? #有効化がされているかどうか
        log_in user 
        params[:session][:remember_me] == '1' ? remember(user) : forget(user) #記憶するかどうか
        request_back_or user #ユーザーの行き先を保存
      else
        message = "Account not activated"
        redirect_to root_path
      end
    end
  end
  
  #ログアウト
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
