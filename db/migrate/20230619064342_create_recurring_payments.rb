# frozen_string_literal: true

class CreateRecurringPayments < ActiveRecord::Migration[7.0]
	def change
		create_table :recurring_payments, id: :uuid do |t|
			t.string :payee, null: false
			t.string :description, null: false
			t.integer :due_day, null: false
			t.string :amount, null: false
			t.date :start_date, null: false
			t.date :end_date

			t.timestamps
		end

		add_reference :recurring_payments, :payer, type: :uuid, foreign_key: { to_table: :users }, null: false
	end
end
