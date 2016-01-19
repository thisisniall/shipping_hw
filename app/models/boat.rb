class Boat < ActiveRecord::Base
	validates_uniqueness_of :boatname
	belongs_to :user
end
