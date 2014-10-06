class Proposal < ActiveRecord::Base
	belongs_to :party

	validates :title, :description, :email, presence: true
	validates :nickname, presence: { message: 'Vous devez renseigner un nom ou un pseudonyme'}, unless: :surname?
	validates :format, inclusion: { in: %w(conference workshop exhibit)}

	before_create do
		self.token = SecureRandom.hex 3
	end

	def name
		self.firstname? ? "#{self.firstname} #{self.surname}" : self.nickname
	end

	def self.hours
		%w(11h00 11h30 12h00 12h30 13h00 13h30 14h00 14h30 15h00 15h30 16h00 16h30 17h00 17h30 18h00)
	end

	def to_param
		self.token
	end
end
