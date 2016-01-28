class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.text :address
      t.string :password
      t.string :profile_img_url
      t.integer :payment

      t.timestamps null: false
    end
  end
end
