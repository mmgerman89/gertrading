class MyStock < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :symbol, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  
  
  def total_purchase
    total_purchase = (purchase_price * quantity) + purchase_commission + purchase_market_right + purchase_iva
  end
  
  def total_sale
    total_sale = (sale_price * quantity) - (sale_commission + sale_market_right + sale_iva)
  end
  
  def result
    result = total_sale - total_purchase
  end
end
