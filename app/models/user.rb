class User < ApplicationRecord
	before_create :create_remember_token
	has_secure_password

	has_many :posts

	private

	def create_remember_token
		token = SecureRandom.urlsafe_base64	
		self.remember_token = Digest::SHA1.hexdigest(token.to_s) 
	end

end
