class ChangeNameTypeFromRateCharts < ActiveRecord::Migration
  def change
    remove_column :rate_charts, :type
    
    add_column :rate_charts, :type_stock, :integer
  end
end
