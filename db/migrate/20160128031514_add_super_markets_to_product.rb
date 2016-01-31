class AddSuperMarketsToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :super_markets, index: true

    add_foreign_key :products, :super_markets, column: :super_markets_id
  end

end
