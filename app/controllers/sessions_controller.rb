class SessionsController < ApplicationController

	def new
		if current_user
			flash[:notice] = "You are already logged in as #{current_user.email}"
			redirect_to '/'
		end
	end

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to root_path, :notice => "Welcome back, #{user.email}"
		else
			flash[:alert] = "Invalid email or password"
		render "new"
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end

end
