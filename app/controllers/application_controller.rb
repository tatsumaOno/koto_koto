class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper
	include UsersHelper

	private
		def logged_in_user
			unless logged_in?
			redirect_to login_path
			end
	 	end
		
		def correct_user
			@user = User.find(current_user.id)
			redirect_to(root_path) unless @user
		end
end
