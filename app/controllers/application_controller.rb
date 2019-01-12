class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	#before_action :set_locale

	def bool(params, name)
		%w(true on 1 t o).include? params[name]
	end

	# def set_locale
	# 	locale = params[:locale]
	# 	locale ||= request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
	# 	locale ||= I18n.default_locale
	# 	I18n.locale = locale
	# end
end
