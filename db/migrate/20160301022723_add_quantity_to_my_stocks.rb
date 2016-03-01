class AddQuantityToMyStocks < ActiveRecord::Migration
  def change
    add_column :my_stocks, :quantity, :integer
  end
end
