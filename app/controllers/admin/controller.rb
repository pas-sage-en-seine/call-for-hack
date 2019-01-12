class Admin::Controller < ApplicationController
	#http_basic_authenticate_with name: 'admin', password: 'up2014'
	before_filter :authenticate

	private
	def authenticate
		if Rails.env == 'production'
			authenticate_or_request_with_http_basic do |username, password|
				@me = Admin.find_by_login username
				!@me.nil? && @me.good_password?(password)
			end
		else
			@me = Admin.find_by_login 'aeris'
			!@me.nil?
		end
	end
end
