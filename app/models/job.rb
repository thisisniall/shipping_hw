class Job < ActiveRecord::Base
	validates_uniqueness_of :job_name, case_sensitive: :false
	validates_numericality_of :price, :greater_that_or_equal_to => 1000
	validates_length_of :cargo_description, minimum:50
	validates_presence_of :job_name, :origin, :destination

	belongs_to :user
	belongs_to :boat
end
