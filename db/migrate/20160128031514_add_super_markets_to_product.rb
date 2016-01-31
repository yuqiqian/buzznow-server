class AddSuperMarketsToProduct < ActiveRecord::Migration
  def change
    add_reference :products, :Supermarkets, index: true

    add_foreign_key :products, :Supermarkets, column: :supermarkets_id
  end

end
