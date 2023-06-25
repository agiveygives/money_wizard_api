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
class Income < ApplicationRecord
	enum frequency: {
		one_time: 'one_time',
		weekly: 'weekly',
		biweekly: 'biweekly',
		monthly: 'monthly',
		yearly: 'yearly'
	}

	validates :amount, presence: true, numericality: { greater_than: 0 }

	validate :end_date_cannot_be_before_start_date

	def end_date_cannot_be_before_start_date
		return unless end_date.present? && end_date < start_date

		errors.add(:end_date, 'must be after the start date')
	end
end
