class User < ActiveRecord::Base
	has_one :user_profile
	has_many :shoplists
end
