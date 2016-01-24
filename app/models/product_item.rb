class ProductItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :shoplist
end
