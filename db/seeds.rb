ActiveRecord::Base.transaction do
	Admin.create! name: 'Admin', login: 'admin', password: 'password'

	Party.create! from: '2014-11-15', to: '2014-11-16', proposal_from: '2014-10-01', proposal_to: '2014-11-01'
	Party.create! from: '2015-05-30', to: '2015-05-31', proposal_from: '2015-03-22', proposal_to: '2015-04-16'
end
