class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.text :address
      t.string :password
      t.string :profile_img_url
      t.references :payments, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
