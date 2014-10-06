class ProposalMailer < ActionMailer::Base
	default from: 'participer14.10@ubuntu-paris.org'

	def create(proposal)
		@proposal = proposal
		mail to: @proposal.email, subject: 'Confirmation de soumission d’une conférence'
	end

	def notify(proposal)
		@proposal = proposal
		mail to: 'participer14.10@ubuntu-paris.org', subject: 'Soumission d’une conférence'
	end
end
