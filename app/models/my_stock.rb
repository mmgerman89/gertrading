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
    
  end
  
  def tax_purchase
    
  end
  
  def total_purchase
    total_purchase = (purchase_price * quantity) + purchase_commission + purchase_commission_iva + purchase_market_right + purchase_market_right_iva
  end

  def subtotal_sale
    
  end
  
  def tax_sale
    
  end
  
  def total_sale
    if self.sale_price > 0 #and symbol
      sale_stock_price = sale_price
    else
      sale_stock_price = self.current_price
    end
    total_sale = (sale_stock_price * self.quantity) - (self.sale_commission + self.sale_commission_iva + self.sale_market_right + self.sale_market_right_iva)
  end
  
  def result
    result = total_sale - total_purchase
  end
  
  def days
    final_date = (sale_date) ? sale_date : Date.today
    days = final_date - purchase_date
    days.to_i
  end
  
  def var
    variation = (total_sale * 100 / total_purchase) - 100
    variation.round(2)
  end
  
  def var_anual
    var_anual = 365 * var / days
    var_anual.round(2)
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
