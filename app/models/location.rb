class Location < ActiveRecord::Base
	validates_uniqueness_of :location_name
end
