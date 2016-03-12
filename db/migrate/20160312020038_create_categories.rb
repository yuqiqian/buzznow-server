class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.references :subcategories, index: true
      t.references :supercategory, index: true
      #t.references :products, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :categories, :categories, column: :subcategories_id
    add_foreign_key :categories, :categories, column: :supercategory_id
  end
end
