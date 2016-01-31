class AddSuperMarketsToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :super_markets, index: true

    add_foreign_key :products, :super_markets, column: :supermarkets_id
  end

end
