class FixColumnName2 < ActiveRecord::Migration
  def change
  	rename_column :payment_transactions, :amout, :amount
  end
end
