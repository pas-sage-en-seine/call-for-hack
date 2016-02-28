class ProposalsController < ApplicationController
	def new
		@party = Party.current
		return render :closed if @party.proposal_to < Date.today
		@proposal = @party.proposals.new
	end

	def create
		@party = Party.current
		return render :closed if @party.proposal_to < Date.today
		if params[:proposal][:avatar]
			image = MiniMagick::Image.read params[:proposal][:avatar]
			image.resize (image.height <= image.width ? '64x>' : 'x64>')
			image.format 'png'
			params[:proposal][:avatar] = image.to_blob
		end

		values = params.require(:proposal).permit %i(surname surname_private firstname firstname_private nickname nickname_private twitter entity entity_site personnal_site format optimal_duration minimal_duration maximal_duration title description email phone avatar)

		values[:availability] = Hash[
			(@party.from .. @party.to).collect { |d| d.strftime '%F' }.select { |d| bool params[d], :available }
									  .collect { |d| [d, {from: params[d][:from], to: params[d][:to]}] } ]

		@proposal = @party.proposals.create values
		unless @proposal.valid?
			flash[:danger] = @proposal.errors.full_messages
			return render :new
		end

		if Rails.env == 'production'
			ProposalMailer.create(@proposal).deliver
			ProposalMailer.notify(@proposal).deliver
		end
		redirect_to action: :confirm
		#redirect_to edit_proposal_path @proposal
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
		@party = @proposal.party
		return render :closed if @party.proposal_to < Date.today
	end

	def avatar
		@proposal = Proposal.find_by_token params[:id]
		p @proposal.avatar
		send_data @proposal.avatar, type: 'image/png', disposition: 'inline' and return if @proposal and @proposal.avatar
		send_file 'app/assets/images/avatar.png', type: 'image/png', disposition: 'inline'
	end
end
