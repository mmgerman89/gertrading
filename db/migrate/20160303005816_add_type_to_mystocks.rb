class AddTypeToMystocks < ActiveRecord::Migration
  def change
    add_column :my_stocks, :type, :integer
  end
end
