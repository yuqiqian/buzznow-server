class Product < ActiveRecord::Base
	has_and_belongs_to_many :super_markets
	belongs_to :brand
	belongs_to :category
end
