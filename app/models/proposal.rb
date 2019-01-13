class Proposal < ActiveRecord::Base
	class Available
		attr_accessor :date, :from, :to
		def initialize(date, json)
			@date = date
			@from = json['from']
			@to = json['to']
		end

		def available
			true
		end
	end
	class NotAvailable
		attr_accessor :date
		def initialize(date)
			@date = date
		end

		def from
			nil
		end

		def to
			nil
		end

		def available
			false
		end
	end

	store :availability, coder: JSON

	belongs_to :party
	has_many :marks

	validates :title, :description, :email, presence: true
	validates :nickname, presence: { message: 'Vous devez renseigner un nom ou un pseudonyme'}, unless: :surname?
	validates :format, inclusion: { in: %w(conference workshop)}
	validates :duration, inclusion: { in: %w(30min 1h 2h)}

	before_create do
		self.token = SecureRandom.hex 3
	end

	def name
		self.nickname? ? self.nickname : "#{self.firstname} #{self.surname}"
	end

	def shortname
		self.nickname? ? self.nickname : self.firstname
	end

	def self.hours
		%w(10h00 11h00 11h30 12h00 12h30 13h00 13h30 14h00 14h30 15h00 15h30 16h00 16h30 17h00 17h30 18h00 19h00 20h00 21h00)
	end

	def to_param
		self.token
	end

	def to_s
		self.title
	end

	def score
		self.marks.size
	end

	def available(date)
		available = self.availability[date.strftime('%F')]
		if available
			available = Available.new date, available
		else
			available = NotAvailable.new date
		end
		available
	end
end
