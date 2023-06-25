# frozen_string_literal: true

# == Schema Information
#
# Table name: one_time_payments
#
#  id          :uuid             not null, primary key
#  amount      :integer          not null
#  description :string           not null
#  paid_at     :date             not null
#  payee       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payee_id    :uuid             not null
#
# Indexes
#
#  index_one_time_payments_on_payee_id  (payee_id)
#
# Foreign Keys
#
#  fk_rails_...  (payee_id => users.id)
#
class OneTimePaymentRepo < ApplicationRepo; end
