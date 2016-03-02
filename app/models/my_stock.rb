class MyStock < ActiveRecord::Base
  after_initialize :default_values
  
  belongs_to :user

  validates :user, presence: true
  validates :symbol, presence: true
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
  
  
  def total_purchase
    total_purchase = (purchase_price * quantity) + purchase_commission + purchase_commission_iva + purchase_market_right + purchase_market_right_iva
  end
  
  def total_sale
    total_sale = (sale_price * quantity) - (sale_commission + sale_commission_iva + sale_market_right + sale_market_right_iva)
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
end
