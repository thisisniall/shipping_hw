class HomeController < ApplicationController
	def index
		@myboats = current_user.boats
		if current_user == nil
			redirect_to '/log-in'
		end
	end
end
