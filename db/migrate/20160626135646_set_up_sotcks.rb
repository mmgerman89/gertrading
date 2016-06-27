class SetUpSotcks < ActiveRecord::Migration
  def change
      add_column :stocks, :open_price, :decimal, precision: 12, scale: 2
      add_column :stocks, :close_price, :decimal, precision: 12, scale: 2

      remove_column :stocks, :low_day
      remove_column :stocks, :high_day
      remove_column :stocks, :volume
      remove_column :stocks, :price

      add_column :stocks, :day_low, :decimal, precision: 12, scale: 2
      add_column :stocks, :day_high, :decimal, precision: 12, scale: 2
      add_column :stocks, :day_price, :decimal, precision: 12, scale: 2
      add_column :stocks, :volume, :decimal, precision: 12, scale: 2

  end
end
