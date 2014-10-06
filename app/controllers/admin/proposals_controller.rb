class Admin::ProposalsController < Admin::Controller
	def index
		@party = Party.first
		@proposals = @party.proposals
	end

	def show
		@proposal = Proposal.find_by_token params[:id]
		@party = @proposal.party
	end

	def destroy
		@proposal = Proposal.find_by_token params[:id]
		@proposal.delete
		flash[:success] = 'Proposition supprimée avec succès'
		redirect_to action: :index
	end
end
