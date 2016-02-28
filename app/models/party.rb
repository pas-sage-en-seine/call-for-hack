class Party < ActiveRecord::Base
	has_many :proposals

	def self.current
		self.order(from: :desc).first
	end

	def title
		"Ubuntu Party #{self.from.day} & #{self.to.day} #{I18n.t('date.month_names')[self.from.month]} #{self.from.year}"
	end
end
