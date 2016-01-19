class BoatsController < ApplicationController

	def edit
		@boat = Boat.find(params[:id])
	end

	def update
		@boat = Boat.find(params[:id])
		@boat.update(boat_params)
		@boat.save
		redirect_to @boat
	end

	def show
		@boat = Boat.find(params[:id])
    	@user = User.where(id: @boat.user_id).first
	end

	def new
		if @current_user = nil
			redirect_to '/'
		end
		@user = current_user
		@boat = Boat.new
		@user = current_user
	end

	def create
		@boat = Boat.new(boat_params)
		# @boat.available_cargo = params[:max_cargo]
		# @boat.current_cargo = 0
		if @boat.save
			redirect_to '/'
		else
			redirect_to new_boat_path
		end
	end

	def index
		@boats = Boat.all
	end

	def destroy
		@boat = Boat.find(params[:id])
		@boat.destroy
		redirect_to boats_path
	end

	private

	def boat_params
		params.require(:boat).permit(:boatname, :max_cargo, :current_cargo, :available_cargo, :current_location).merge(user_id: @user.id)
	end
end
