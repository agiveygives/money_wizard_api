# frozen_string_literal: true

# == Schema Information
#
# Table name: recurring_payments
#
#  id          :uuid             not null, primary key
#  amount      :string           not null
#  description :string           not null
#  due_day     :integer          not null
#  end_date    :date
#  payee       :string           not null
#  start_date  :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  payer_id    :uuid             not null
#
# Indexes
#
#  index_recurring_payments_on_payer_id  (payer_id)
#
# Foreign Keys
#
#  fk_rails_...  (payer_id => users.id)
#
require 'test_helper'

class RecurringPaymentTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end
end
