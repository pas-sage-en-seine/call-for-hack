ActiveRecord::Base.transaction do
	Party.create! from: '2019-06-27T11:00', to: '2019-06-30T20:00', proposal_from: '2019-02-01', proposal_to: '2019-04-15'
end
