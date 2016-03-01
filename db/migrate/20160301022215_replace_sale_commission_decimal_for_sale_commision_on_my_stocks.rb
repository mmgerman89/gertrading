class ReplaceSaleCommissionDecimalForSaleCommisionOnMyStocks < ActiveRecord::Migration
  def change
    remove_column :my_stocks, :sale_commission_decimal
    
    add_column :my_stocks, :sale_commission, :decimal
  end
end
