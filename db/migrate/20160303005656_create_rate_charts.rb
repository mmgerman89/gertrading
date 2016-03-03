class CreateRateCharts < ActiveRecord::Migration
  def change
    create_table :rate_charts do |t|
      t.integer :type
      t.date :since
      t.date :until
      t.decimal :commission, precision: 12, scale: 2
      t.decimal :commission_iva, precision: 12, scale: 2
      t.decimal :market_right, precision: 12, scale: 2
      t.decimal :market_right_iva, precision: 12, scale: 2

      t.timestamps null: false
    end
  end
end
