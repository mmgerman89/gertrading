class AddUserToRateCharts < ActiveRecord::Migration
  def change
    add_column :rate_charts, :user_id, :integer
  end
end
