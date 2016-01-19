class UsersController < ApplicationController
	def new
		@user=User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the site!"
			session[:user_id] = @user.id
			redirect_to "/"
		else
			flash[:alert] = "There was a problem creating your account. Please try again."
			redirect_to :back
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
	  	@user = User.find(params[:id])
	  	@user.update(user_params)
	  	@user.save
	  	redirect_to @user
  	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
		@boats = @user.boats
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		session[:user_id] = nil
		current_user = nil
		flash[:notice] = "Account Deleted"
		redirect_to '/'
	end

	private

	def user_params
		params.require(:user).permit(:email, :fname, :lname, :password, :password_confirmation)
	end

end
