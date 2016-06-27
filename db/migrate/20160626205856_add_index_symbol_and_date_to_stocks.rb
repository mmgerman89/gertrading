class AddIndexSymbolAndDateToStocks < ActiveRecord::Migration
  def change
  	add_index :stocks, [:symbol, :date]
  end
end
