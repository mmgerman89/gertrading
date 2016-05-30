# == Schema Information
#
# Table name: my_stocks
#
#  id                        :integer          not null, primary key
#  symbol                    :string
#  purchase_date             :date
#  purchase_price            :decimal(12, 2)   default(0.0)
#  purchase_commission       :decimal(12, 2)   default(0.0)
#  purchase_market_right     :decimal(12, 2)   default(0.0)
#  sale_date                 :date
#  sale_price                :decimal(12, 2)   default(0.0)
#  sale_market_right         :decimal(12, 2)   default(0.0)
#  user_id                   :integer
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  sale_commission           :decimal(12, 2)   default(0.0)
#  quantity                  :integer          default(0)
#  purchase_market_right_iva :decimal(12, 2)   default(0.0)
#  sale_market_right_iva     :decimal(12, 2)   default(0.0)
#  purchase_commission_iva   :decimal(12, 2)   default(0.0)
#  sale_commission_iva       :decimal(12, 2)   default(0.0)
#  type_stock                :integer
#

require 'test_helper'

class MyStockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
