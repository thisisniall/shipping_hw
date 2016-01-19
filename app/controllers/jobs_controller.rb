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
		@Job = Job.find(params[:id])
	end

	def update
	  	@job = Job.find(params[:id])
	  	@job.update(job_params)
	  	@job.save
	  	redirect_to @job
	  	# may need to do some boat updating here!
  	end

  	def index
		@jobs = Job.all
	end

	def show
		@job = Job.find(params[:id])
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		# may need to do some boat updating here!!!
		redirect_to '/'
	end

	private

	def job_params
		params.require(:job).permit(:job_name, :cargo_size, :price, :origin, :destination, :employer_id, :boat_id, :cargo_description)
	end

end
