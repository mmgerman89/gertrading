class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.string :symbol
      t.decimal :price
      t.date :date
      t.decimal :low_day
      t.decimal :high_day
      t.decimal :volume

      t.timestamps null: false
    end
  end
end
