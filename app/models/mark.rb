class Mark < ActiveRecord::Base
	belongs_to :admin
	belongs_to :proposal
end
