class Admin::ProposalsController < Admin::Controller
	def index
		@party = Party.first
		@proposals = @party.proposals.sort do |a, b|
			score = b.score <=> a.score
			score.zero? ? (a.title <=> b.title) : score
		end
	end

	def show
		@proposal = Proposal.find_by_token params[:id]
		@party = @proposal.party
	end

	def destroy
		@proposal = Proposal.find_by_token params[:id]
		@proposal.delete
		flash[:success] = "Proposition `#{@proposal}` supprimée avec succès."
		redirect_to action: :index
	end

	def mark
		@proposal = Proposal.find_by_token params[:id]
		@me.proposals << @proposal
		flash[:success] = "Proposition `#{@proposal}` plussée avec succès."
		redirect_to action: :index
	end

	def unmark
		@proposal = Proposal.find_by_token params[:id]
		@me.proposals.delete @proposal
		flash[:success] = "Proposition `#{@proposal}` moinsée avec succès."
		redirect_to action: :index
	end
end
