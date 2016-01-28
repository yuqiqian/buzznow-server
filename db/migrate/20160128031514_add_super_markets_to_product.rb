class AddSuperMarketsToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :Supermarkets, index: true, foreign_key: true
  end
end
