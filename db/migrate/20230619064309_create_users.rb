# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
	def change
		create_table :users, id: :uuid do |t|
			t.string :first_name, null: false
			t.string :last_name, null: false
			t.string :email, null: false, index: { unique: true }
			t.string :phone_number, null: false, index: { unique: true }

			t.timestamps
		end
	end
end
