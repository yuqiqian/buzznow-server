class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user_profile, index: true, foreign_key: true
      t.integer :card_last_four_digit
      t.text :billing_address

      t.timestamps null: false
    end
  end
end
