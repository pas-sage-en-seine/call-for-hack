class Admin::Controller < ApplicationController
	#http_basic_authenticate_with name: 'admin', password: 'up2014'
	before_filter :authenticate

	private
	def authenticate
		authenticate_or_request_with_http_basic do |username, password|
			@me = Admin.find_by_login username
			!@me.nil? && @me.good_password?(password)
		end
	end
end
