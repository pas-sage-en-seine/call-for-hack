class ProposalsController < ApplicationController
	def new
		@party = Party.current
		return render :soon if @party.proposal_from > Date.today
		return render :closed if @party.proposal_to < Date.today
		@proposal = @party.proposals.new
	end

	def create
		@party = Party.current
		return render :soon if @party.proposal_from > Date.today
		return render :closed if @party.proposal_to < Date.today

		values = params.require(:proposal).permit %i[surname surname_private
		firstname firstname_private nickname nickname_private mastodon twitter entity
		entity_site personnal_site format duration title description email phone]

		values[:availability] = @party.days.collect { |d| d.strftime '%F' }
										.select { |d| bool params[d], :available }
										.collect { |d| [d, { from: params[d][:from], to: params[d][:to] }] }
										.to_h

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

	def edit
		@proposal = Proposal.find_by_token params[:id]
		@party    = @proposal.party
	end

	def update
		@proposal = Proposal.find_by_token params[:id]
		@party    = @proposal.party

		values = params.require(:proposal).permit %i[surname surname_private
		firstname firstname_private nickname nickname_private mastodon twitter entity
		entity_site personnal_site format duration title description email phone]

		values[:availability] = @party.days.collect { |d| d.strftime '%F' }
										.select { |d| bool params[d], :available }
										.collect { |d| [d, { from: params[d][:from], to: params[d][:to] }] }.to_h

		@proposal.update values
		unless @proposal.valid?
			flash[:danger] = @proposal.errors.full_messages
			return render :edit
		end

		redirect_to action: :edit
	end
end
