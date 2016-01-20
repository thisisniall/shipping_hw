class HomeController < ApplicationController
	def index
		if current_user == nil
			redirect_to '/log-in'
		end
		@openjobs = Job.where(boat_id: nil)
	end
end
