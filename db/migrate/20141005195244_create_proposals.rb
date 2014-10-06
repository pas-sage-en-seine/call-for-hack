class CreateProposals < ActiveRecord::Migration
	def change
		create_table :proposals do |t|
			t.references :party, null: false

			t.text :firstname
			t.boolean :firstname_private
			t.text :surname
			t.boolean :surname_private
			t.text :nickname
			t.text :avatar
			t.text :twitter
			t.text :site
			t.text :format
			t.text :minimal_duration
			t.text :optimal_duration
			t.text :maximal_duration
			t.text :title
			t.text :description
			t.text :email
			t.text :phone
			t.text :availability
			t.text :token

			t.timestamps
		end
	end
end
