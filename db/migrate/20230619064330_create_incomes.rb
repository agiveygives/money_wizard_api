# frozen_string_literal: true

class CreateIncomes < ActiveRecord::Migration[7.0]
	def change
		create_table :incomes, id: :uuid do |t|
			t.string :payer, null: false
			t.integer :amount, null: false
			t.string :frequency, null: false
			t.string :pay_day
			t.date :start_date, null: false
			t.date :end_date

			t.timestamps
		end

		add_reference :incomes, :payee, type: :uuid, foreign_key: { to_table: :users }, null: false
	end
end
