class TransformSaleIvaToDecimalOnMyStocks < ActiveRecord::Migration
  def change
    remove_column :my_stocks, :sale_iva
    add_column :my_stocks, :sale_iva, :decimal
  end
end
