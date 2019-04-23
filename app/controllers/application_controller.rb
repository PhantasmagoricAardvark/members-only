class ApplicationController < ActionController::Base
	
	def log_in(user)
		token = SecureRandom.urlsafe_base64
		cookies.permanent[:user_id] = user.id
		current_user=(user)
	end

	def current_user=(user)
		@user = User.find(cookies.permanent[:user_id])	
	end

	def current_user
		if cookies.permanent[:user_id] 
			@user ||= User.find(cookies.permanent[:user_id])
		else
			nil
		end
	end

	def sign_out
		current_user = nil
		cookies.delete(:user_id)
	end

end
