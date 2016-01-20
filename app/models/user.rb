class User < ActiveRecord::Base
	validates_uniqueness_of :email, case_sensitive: :false

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	has_many :boats, dependent: :destroy
	has_many :jobs 
end
