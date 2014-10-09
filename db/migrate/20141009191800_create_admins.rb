class CreateAdmins < ActiveRecord::Migration
	def change
		create_table :admins do |t|
			t.text :name
			t.text :login
			t.text :password

			t.timestamps
		end
	end
end
