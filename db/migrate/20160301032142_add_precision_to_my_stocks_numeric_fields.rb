class AddPrecisionToMyStocksNumericFields < ActiveRecord::Migration
  def change
    change_column :my_stocks, :purchase_price, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :purchase_commission, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :purchase_market_right, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :purchase_iva, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :sale_price, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :sale_commission, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :sale_market_right, :decimal, precision: 12, scale: 2
    change_column :my_stocks, :sale_iva, :decimal, precision: 12, scale: 2
  end
end
