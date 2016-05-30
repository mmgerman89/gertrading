# == Schema Information
#
# Table name: rate_charts
#
#  id               :integer          not null, primary key
#  since            :date
#  until            :date
#  commission       :decimal(12, 2)
#  commission_iva   :decimal(12, 2)
#  market_right     :decimal(12, 2)
#  market_right_iva :decimal(12, 2)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  type_stock       :integer
#  commission_min   :decimal(12, 2)
#

require 'test_helper'

class RateChartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
