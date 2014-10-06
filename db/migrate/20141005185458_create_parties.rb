class CreateParties < ActiveRecord::Migration
	def change
		create_table :parties do |t|
			t.date :from, null: false
			t.date :to, null: false
			t.date :proposal_from, null: false
			t.date :proposal_to, null: false

			t.timestamps
		end
	end
end
