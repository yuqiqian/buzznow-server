class CreateProductItems < ActiveRecord::Migration
  def change
    create_table :product_items do |t|
      t.references :product, index: true, foreign_key: true
      t.decimal :quantity
      t.boolean :is_bought
      t.references :shoplist, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
