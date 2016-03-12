class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_img
      t.decimal :price
      t.string :nutrition
      t.belongs_to :brand, index: true
      t.belongs_to :category, index: true
      
      t.timestamps null: false
    end
  end
end
