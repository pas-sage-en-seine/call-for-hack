class CreateAdmins < ActiveRecord::Migration[5.2]
	def change
		create_table :admins do |t|
			t.text :name
			t.text :login
			t.text :password

			t.timestamps
		end
	end
end
