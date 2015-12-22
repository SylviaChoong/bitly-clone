class CreateUrls < ActiveRecord::Migration
	def change
		#Write a code that will create a URLs table and its needed fields
		#Think of your database like a giant Excel Spreadsheet.
		create_table :urls do |t|
			t.text :long_url
			t.text :short_url
			t.integer :click_count, default: 0

			t.timestamps null: false
		end
	end
end
