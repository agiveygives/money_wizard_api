# frozen_string_literal: true

class CreateOneTimePayments < ActiveRecord::Migration[7.0]
	def change
		create_table :one_time_payments, id: :uuid do |t|
			t.string :payee, null: false
			t.string :description, null: false
			t.date :paid_at, null: false
			t.integer :amount, null: false

			t.timestamps
		end

		add_reference :one_time_payments, :payee, type: :uuid, foreign_key: { to_table: :users }, null: false
	end
end
