class RenameTypeOnMyStocks < ActiveRecord::Migration
  def change
    remove_column :my_stocks, :type
    
    add_column :my_stocks, :type_stock, :integer
  end
end
