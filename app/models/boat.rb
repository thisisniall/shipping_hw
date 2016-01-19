class Boat < ActiveRecord::Base
	validates_uniqueness_of :boatname
	belongs_to :user

	def self.setavailcargo
		self.available_cargo = params[:max_cargo]
	end
end
