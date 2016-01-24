class JobsController < ApplicationController
	def new
		@job=Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			redirect_to "/"
		else
			redirect_to :back
		end
	end

	def edit
		@job = Job.find(params[:id])
		@enoughspace = Boat.where(user_id: current_user.id).where(
 "available_cargo >= ?", @job.cargo_size)
		# need to update for fringe-case - boats that already have the job should ALWAYS appear on this list
	end

	def update
		#byebug
		puts params.inspect
	  	@job = Job.find(params[:id])
	  	# @oldboat methods here re-adds the space to the boat that curently has the job
	  	#is_there_an_old_boat is a method in Job model
	  	if @job.is_there_an_old_boat == true
	  		@oldboat = Boat.find(@job.boat_id)
		  	@oldboat.update_attributes(available_cargo: @oldboat.available_cargo + @job.cargo_size)
		  	@oldboat.update_attributes(current_cargo: @oldboat.current_cargo - @job.cargo_size)
	  	end
	  	# new boat is selected from dropdown menu, which is only populated by boats with enough space (and proper user id)
	  	if params[:job][:boat_id]
		  	@newboat = Boat.find(params[:job][:boat_id]) #changes still need
		  	@newboat.update_attributes(available_cargo: @newboat.available_cargo - @job.cargo_size)
		  	@newboat.update_attributes(current_cargo: @newboat.current_cargo + @job.cargo_size)
	 	end
	  	# save and redirect
	  	@job.update(job_params)
	  	@job.save
	  	redirect_to @job
  	end

  	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
		# logical check to find a boat owned by the current user and with enough open cargo space to take the job
		@enoughspace = Boat.where(user_id: current_user.id).where(
 "available_cargo >= ?", @job.cargo_size)
		
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		# may need to do some boat updating here!!!
		redirect_to '/'
	end

	private

	def job_params
		params.require(:job).permit(:job_name, :cargo_size, :price, :origin, :destination, :user_id, :boat_id, :cargo_description)
	end

	# needed due to some boat space manipulations
	def boat_params
		#params.require(:boat).permit(:current_cargo, :available_cargo)
	end

end
