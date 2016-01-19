class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	helper_method :current_user
  	# will be available everywhere

	def current_user
		# checks to see if session exists, if so, loads user
		# and saves into @user instance variable
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
  	
end
