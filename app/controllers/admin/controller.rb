class Admin::Controller < ApplicationController
	http_basic_authenticate_with name: 'admin', password: 'up2014'
end
