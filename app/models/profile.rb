class Profile < ApplicationRecord
	before_save {self.email = email.downcase}

	validates :email, presence: true, length:{ maximum: 255},	          
	          uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
end
