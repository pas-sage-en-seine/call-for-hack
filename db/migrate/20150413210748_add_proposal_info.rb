class AddProposalInfo < ActiveRecord::Migration
	def change
		rename_column :proposals, :site, :personnal_site

		add_column :proposals, :nickname_private, :boolean
		add_column :proposals, :entity, :string
		add_column :proposals, :entity_site, :string

		change_column :proposals, :firstname, :string
		change_column :proposals, :surname, :string
		change_column :proposals, :nickname, :string
		change_column :proposals, :entity_site, :string
		change_column :proposals, :minimal_duration, :string
		change_column :proposals, :optimal_duration, :string
		change_column :proposals, :maximal_duration, :string
		change_column :proposals, :title, :string
		change_column :proposals, :email, :string
		change_column :proposals, :phone, :string
		change_column :proposals, :token, :string

		change_column :proposals, :avatar, :binary

		change_column :admins, :name, :string
		change_column :admins, :login, :string
		change_column :admins, :password, :string
	end
end
