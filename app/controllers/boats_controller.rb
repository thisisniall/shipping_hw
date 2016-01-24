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
		@user = current_user
		@boat = Boat.new(boat_params)
		if @boat.save
			# sets avail=max on creation, re-saves
			@boat.available_cargo = @boat.max_cargo
			@boat.save
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
		@boat.jobs.each do |j|
			j.update_attribute(:boat_id,nil)
		end
		@boat.destroy
		redirect_to boats_path
	end

	private

	def boat_params
		params.require(:boat).permit(:boatname, :max_cargo, :current_cargo, :available_cargo, :current_location).merge(user_id: current_user.id)
	end
end
