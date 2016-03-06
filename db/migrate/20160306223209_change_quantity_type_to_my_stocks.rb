class ChangeQuantityTypeToMyStocks < ActiveRecord::Migration
  def change
    change_column :my_stocks, :quantity, :integer
  end
end
