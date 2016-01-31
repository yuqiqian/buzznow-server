class AddUserProfileToUser < ActiveRecord::Migration
  def change
  	add_reference :users, :user_profile, index: true
  	add_foreign_key :users, :user_profiles
  end
end
