class CreateSuperMarkets < ActiveRecord::Migration
  def change
    create_table :super_markets do |t|
      t.text :name
      t.references :products, index: true, foreign_key: true
      t.text :picture

      t.timestamps null: false
    end
  end
end
