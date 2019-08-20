class AccountActivationsController < ApplicationController
	 # 有効化後
	 def edit
 		 user = User.find_by(email: params[:email])
 		 if user && !user.activated? && user.authenticated?(:activation,params[:id])
  			 user.update_attribute(:activated, true) # 有効化を許可
  			 user.update_attribute(:activated_at,Time.zone.now) 
  			 log_in user
  			 flash[:success] = "アカウントを有効化できました"
  			 redirect_to user
  		else
  			 redirect_to root_path
  		end
 	end
end
