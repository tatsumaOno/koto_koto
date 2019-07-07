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
        flash[:success] = "ログイン成功しました"
        redirect_to user
      else
        flash[:alert] = "アカウントを有効化してください"
        redirect_to root_path
      end
    else
      flash.now[:danger] = '無効なメールアドレスとパスワードの組み合わせです'
      render 'new'
    end
  end
  
  #ログアウト
  def destroy
    log_out if logged_in?
    flash[:alert] = "ログアウトしました"
    redirect_to root_path
  end
end
