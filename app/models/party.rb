class Party < ActiveRecord::Base
	has_many :proposals

	def self.current
		self.order(from: :desc).first
	end

	def title
		from_month = I18n.t('date.month_names')[self.from.month]
		to_month   = I18n.t('date.month_names')[self.to.month]
		if from_month == to_month
			I18n.t :title_single_month, {from_day: self.from.day, to_day: self.to.day, to_month: from_month, year: self.from.year}
		else
			I18n.t :title_dual_month, {from_day: self.from.day, from_month: from_month, to_day: self.to.day, to_month: to_month, year: self.from.year}
		end
	end

	def days
		self.from.to_date .. self.to.to_date
	end
end
