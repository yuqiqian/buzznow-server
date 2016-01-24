class CreatePaymentTransactions < ActiveRecord::Migration
  def change
    create_table :payment_transactions do |t|
      t.references :requester, index: true, foreign_key: true
      t.references :helper, index: true, foreign_key: true
      t.datetime :payment_time
      t.decimal :amout
      t.references :payment_method, index: true, foreign_key: true
      t.integer :transaction_id

      t.timestamps null: false
    end
  end
end
