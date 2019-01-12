ActiveRecord::Base.transaction do
	Party.create! from: '2017-06-29', to: '2017-07-02', proposal_from: '2017-04-15', proposal_to: '2017-05-15'
end
