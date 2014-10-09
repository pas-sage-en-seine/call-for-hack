class Admin < ActiveRecord::Base
	has_many :marks
	has_many :proposals, through: :marks

	before_create :hash_password
	before_update do
		hash_password if self.password_changed?
	end

	def good_password?(password)
		SCrypt::Password.new(self.password) == password
	end

	private
	def hash_password
		self.password = SCrypt::Password.create self.password
	end
end
