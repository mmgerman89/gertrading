class AddCommissionMinToRateCharts < ActiveRecord::Migration
  def change
    add_column :rate_charts, :commission_min, :decimal, precision: 12, scale: 2
  end
end
