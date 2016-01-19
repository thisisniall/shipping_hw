class HomeController < ApplicationController
	def index
		if current_user == nil
			redirect_to '/log-in'
		end
	end
end
