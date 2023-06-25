# frozen_string_literal: true

# == Schema Information
#
# Table name: incomes
#
#  id         :uuid             not null, primary key
#  amount     :integer          not null
#  end_date   :date
#  frequency  :string           not null
#  pay_day    :string
#  payer      :string           not null
#  start_date :date             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  payee_id   :uuid             not null
#
# Indexes
#
#  index_incomes_on_payee_id  (payee_id)
#
# Foreign Keys
#
#  fk_rails_...  (payee_id => users.id)
#
class IncomeRepo < ApplicationRepo
	def initialize(income_params:)
		super

		@income_params = income_params
	end

	attr_reader :income_params
end
