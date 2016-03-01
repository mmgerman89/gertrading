class CreateMyStocks < ActiveRecord::Migration
  def change
    create_table :my_stocks do |t|
      t.string :symbol
      t.date :purchase_date
      t.decimal :purchase_price
      t.decimal :purchase_commission
      t.decimal :purchase_market_right
      t.decimal :purchase_iva
      t.date :sale_date
      t.decimal :sale_price
      t.string :sale_commission_decimal
      t.decimal :sale_market_right
      t.string :sale_iva
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
