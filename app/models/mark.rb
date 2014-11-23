class Mark < ActiveRecord::Base
	belongs_to :admin
	belongs_to :proposal

	validates_uniqueness_of :proposal_id, scope: :admin_id
end
