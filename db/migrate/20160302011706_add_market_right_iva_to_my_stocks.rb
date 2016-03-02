class AddMarketRightIvaToMyStocks < ActiveRecord::Migration
  def change
    add_column :my_stocks, :purchase_market_right_iva, :decimal, precision: 12, scale: 2
    add_column :my_stocks, :sale_market_right_iva, :decimal, precision: 12, scale: 2
    
    remove_column :my_stocks, :purchase_iva
    remove_column :my_stocks, :sale_iva
    add_column :my_stocks, :purchase_commission_iva, :decimal, precision: 12, scale: 2
    add_column :my_stocks, :sale_commission_iva, :decimal, precision: 12, scale: 2
  end
end
