class CreateListStocks < ActiveRecord::Migration
  def change
    create_table :list_stocks do |t|
      t.string :name
      t.string :market

      t.timestamps null: false
    end
  end
end
