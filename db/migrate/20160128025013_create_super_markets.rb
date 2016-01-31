class CreateSuperMarkets < ActiveRecord::Migration
  def change
    create_table :super_markets do |t|
      t.text :name
      t.references :products, index: true
      t.text :picture

      t.timestamps null: false
    end
    add_foreign_key :super_markets, :products, column: :products_id
  end
end
