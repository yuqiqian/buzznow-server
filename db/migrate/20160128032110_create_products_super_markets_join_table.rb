class CreateProductsSuperMarketsJoinTable < ActiveRecord::Migration
  def change
    create_table :products_super_markets, id: false do |t|
      t.integer :product_id
      t.integer :super_market_id
      t.timestamps null: false
    end
  end
end
