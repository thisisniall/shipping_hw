class Boat < ActiveRecord::Base
	validates_uniqueness_of :boatname
	belongs_to :user
	has_many :jobs

	def self.setavailcargo
		self.available_cargo = params[:max_cargo]
	end

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
