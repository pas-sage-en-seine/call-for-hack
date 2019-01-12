class ProposalMailer < ActionMailer::Base
	default from: 'cfh@passageenseine.fr'

	def create(proposal)
		@proposal = proposal
		mail to: @proposal.email, subject: 'Confirmation de soumission d’une conférence'
	end

	def notify(proposal)
		@proposal = proposal
		mail to: 'cfh@passageenseine.fr', subject: 'Soumission d’une conférence'
	end
end
