class AddIndexs < ActiveRecord::Migration
	def change
		add_index :urls, :long_url
	end
end

#run rake db:migrate