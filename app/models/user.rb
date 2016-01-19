class User < ActiveRecord::Base
	validates_uniqueness_of :email

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create

	has_many :boats, dependent: :destroy
	# not sure if dependent:destroy makes sense here
end
