class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |t|
			t.string :original_url
			t.string :shorten_url
			t.integer :user_id
			t.integer :counter, default: 0
			t.timestamps null: false
		end
	end
end
