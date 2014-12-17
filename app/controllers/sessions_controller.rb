class SessionsController < ApplicationController
	skip_before_filter :authorize	
	def create
		user = User.find_by_username(params[:username])
		if user and user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to user_path(session[:user_id])
		else
			redirect_to login_url, alert: "Invalid user/password combination"
		end
	end

  
	def destroy
		session[:user_id] = nil
		redirect_to login_url, notice: "Logged out"
	end

	def new
		if session[:user_id]
			redirect_to user_path(session[:user_id])
		end
	end
end
