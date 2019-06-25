class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        request_back_or user
      else
        message = "Account not activated"
        redirect_to root_path
      end
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
