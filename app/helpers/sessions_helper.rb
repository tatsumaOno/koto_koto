module SessionsHelper
	 def log_in(user)
 		 session[:user_id] = user.id # このsessionは作成したsessionとは別物
 	end
	
	 # 記憶する時の処理
	 def remember(user)
 		 user.remember # remember_tokenとremember_digestを作成
 		 cookies.permanent.signed[:user_id] = user.id # cookieに暗号化したuser_idを保存
 		 cookies.permanent[:remember_token] = user.remember_token # remember_tokenに期限を保存
 	end

	 # 現在のユーザー 
	 def current_user
 		 if (user_id = session[:user_id])
  			 @current_user ||= User.find_by(id: user_id)
  		elsif(user_id = cookies.signed[:user_id]) # cookieの暗号化を解いている
  			 user = User.find_by(id: user_id) 
  			 if user && user.authenticated?(:remember,cookies[:remember_token])
   				 log_in user
   				 @current_user = user
   			end
  		end
 	end

	 # 記憶しない時の処理
	 def forget(user)
 		 user.forget # remember_digestをnilにしている
 		 cookies.delete(:user_id) # cookieのuser_idとremember_tokenを削除している
 		 cookies.delete(:remember_token)
 	end

	 def logged_in?
 		 !current_user.nil?
 	end

	 def log_out
 		 forget(current_user)
 		 session.delete(:user_id)
 		 @current_user = nil
 	end
end
