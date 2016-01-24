class CreateShoplists < ActiveRecord::Migration
  def change
    create_table :shoplists do |t|
      t.references :requester, index: true, foreign_key: true
      t.references :helper
      t.string :supermarket
      t.datetime :expire_time
      t.decimal :total_price
      t.decimal :actual_price
      t.string :status

      t.timestamps null: false
    end
  end
end
