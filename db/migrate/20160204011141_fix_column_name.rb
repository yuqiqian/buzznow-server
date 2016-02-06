class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :shoplists, :receipt_url, :receipt
  end
end
