require 'bcrypt'

class Account < ApplicationRecord
	attr_accessor :password

	before_save :encrypt_password

	has_many :course_students, foreign_key: :student_id
	has_many :courses, through: :course_students

	enum role: [:student, :admin]

	# account = Account.new
	# account.encrypt_password
	def encrypt_password
		if self.password.present?
			self.encrypted_password = BCrypt::Password.create(self.password)
		end	
	end

	# Account.authenticate_account
	def self.authenticate(email, password)

	  account = Account.where(email: email).first

	  return false unless account
	    
	    if BCrypt::Password.new(account.encrypted_password) == password
	    	return account
	    else
	    	return false
	    end
	end
end
