# == Schema Information
#
# Table name: stocks
#
#  id          :integer          not null, primary key
#  symbol      :string
#  date        :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  open_price  :decimal(12, 2)
#  close_price :decimal(12, 2)
#  day_low     :decimal(12, 2)
#  day_high    :decimal(12, 2)
#  day_price   :decimal(12, 2)
#  volume      :decimal(12, 2)
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
