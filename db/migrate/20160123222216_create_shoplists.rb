class CreateShoplists < ActiveRecord::Migration
  def change
    create_table :shoplists do |t|
      t.references :requester, index: true
      t.references :helper, index: true
      t.string :supermarket
      t.datetime :expire_time
      t.decimal :total_price
      t.decimal :actual_price
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :shoplists, :users, column: :requester_id
    add_foreign_key :shoplists, :users, column: :helper_id
  end
end
