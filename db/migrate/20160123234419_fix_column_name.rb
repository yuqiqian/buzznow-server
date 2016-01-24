class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :product_items, :shoppinglist_id, :shoplist_id
  end
end
