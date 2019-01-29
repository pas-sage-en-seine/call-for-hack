class CreateMarks < ActiveRecord::Migration[5.2]
	def change
		create_table :marks do |t|
			t.references :admin
			t.references :proposal

			t.timestamps
		end

		add_index :marks, %i(admin_id proposal_id), unique: true
	end
end
