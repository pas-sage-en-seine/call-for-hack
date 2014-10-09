class CreateMarks < ActiveRecord::Migration
	def change
		create_table :marks do |t|
			t.references :admin
			t.references :proposal

			t.timestamps
		end
	end
end
