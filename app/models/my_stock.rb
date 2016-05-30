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

class MyStock < ActiveRecord::Base
  after_initialize :default_values
  
  belongs_to :user

  validates :user, presence: true
  validates :symbol, presence: true
  validates :type_stock, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :purchase_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_commission, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_commission_iva, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_market_right, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :purchase_market_right_iva, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_commission, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_commission_iva, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_market_right, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sale_market_right_iva, presence: true, numericality: { greater_than_or_equal_to: 0 }
  
  def subtotal_purchase
    self.quantity * self.purchase_price
  end
  
  def tax_purchase
    self.purchase_commission + self.purchase_commission_iva + self.purchase_market_right + self.purchase_market_right_iva
  end
  
  def total_purchase
    self.subtotal_purchase + self.tax_purchase
  end

  def subtotal_sale
    self.quantity * showed_sale_price
  end
  
  def tax_sale
    self.sale_commission + self.sale_commission_iva + self.sale_market_right + self.sale_market_right_iva
  end
  
  def total_sale
    total_sale = subtotal_sale - self.tax_sale
  end
  
  def result
    self.total_sale - self.total_purchase
  end
  
  def days
    final_date = (self.sale_date) ? self.sale_date : Date.today
    days = final_date - self.purchase_date
    days.to_i
  end
  
  def variation
    variation = (self.total_sale * 100 / self.total_purchase) - 100
    variation.round(2)
  end
  
  def variation_anual
    var_anual = 365 * self.variation / self.days
    var_anual.round(2)
  end

  def showed_sale_price
    if self.sale_price > 0
      self.sale_price
    else
      current_price
    end
  end

  def current_price
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.quote(symbol + ".BA")
    current_stock_price = data.last_trade_price.to_f
    setCurrentSaleValues(self.quantity, current_stock_price)
    current_stock_price
  end
  
  protected
    
  def default_values
    self.purchase_price ||= 0.00
    self.purchase_commission ||= 0.00
    self.purchase_commission_iva ||= 0.00
    self.purchase_market_right ||= 0.00
    self.purchase_market_right_iva ||= 0.00
    self.sale_price ||= 0.00
    self.sale_commission ||= 0.00
    self.sale_commission_iva ||= 0.00
    self.sale_market_right ||= 0.00
    self.sale_market_right_iva ||= 0.00
  end

  def setCurrentSaleValues(quantity, current_stock_price)
    rc = RateChart.new
    current_user = self.user
    sale_chart = rc.current(current_user, Date.today, self.type_stock, "Sale")
    amount = (current_stock_price * quantity)
    if sale_chart
      self.sale_commission = sale_chart.commission * amount / 100
      self.sale_commission_iva = sale_chart.commission_iva * self.sale_commission / 100
      self.sale_market_right = sale_chart.market_right * amount / 100
      self.sale_market_right_iva = sale_chart.market_right_iva * self.sale_market_right / 100
    end
  end

end
