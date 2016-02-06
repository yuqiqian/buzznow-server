class AddReceiptUrlToShoplist < ActiveRecord::Migration
  def change
  	add_column :shoplists, :receipt_url, :text
  end
end
