class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "subcategories_id"
  belongs_to :supercategory, :class_name => "Category", :foreign_key => "supercategory_id"
  has_many :products
end
