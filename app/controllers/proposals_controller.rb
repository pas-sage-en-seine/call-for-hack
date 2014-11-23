class ProposalsController < ApplicationController
	def new
		@party = Party.first
		return render :closed if @party.proposal_to < Date.today
		@proposal = @party.proposals.new
	end

	def create
		@party = Party.first
		return render :closed if @party.proposal_to < Date.today
		values = params.require(:proposal).permit %i(surname surname_private firstname firstname_private nickname twitter site format optimal_duration minimal_duration maximal_duration title description email phone)
		availability = {}
		%i(saturday sunday).each do |day|
			availability[day] = {from: params["#{day}_from"], to: params["#{day}_to"]} if bool(params, day)
		end
		p values
		values[:availability] = JSON.generate availability

		@proposal = @party.proposals.create values
		unless @proposal.valid?
			flash[:danger] = @proposal.errors.full_messages
			return render :new
		end

		ProposalMailer.create(@proposal).deliver
		ProposalMailer.notify(@proposal).deliver
		redirect_to action: :confirm
	end

	def confirm
	end

	def destroy
		@proposal = Proposal.find_by_token params[:id]
		@proposal.delete
		return render :closed if @party.proposal_to < Date.today
		flash[:success] = 'Proposition de conférence supprimée'
	end

	def show
	end

	def edit
		@proposal = Proposal.find_by_token params[:id]
		@party = @proposal.party
		return render :closed if @party.proposal_to < Date.today
	end

	def update
		@proposal = Proposal.find_by_token params[:id]
		@party = @proposal.party
		values = params.require(:proposal).permit %i(surname surname_private firstname firstname_private nickname twitter site format optimal_duration minimal_duration maximal_duration title description email phone)
		# availability = {}
		# %i(saturday sunday).each do |day|
		# 	availability[day] = {from: params["#{day}_from"], to: params["#{day}_to"]} if bool(params, day)
		# end
		p values
		values[:availability] = JSON.generate availability

		@proposal.update values
		flash[:danger] = @proposal.errors.full_messages unless @proposal.valid?
		render :edit
	end
end
