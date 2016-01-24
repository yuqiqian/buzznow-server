class Shoplist < ActiveRecord::Base
  belongs_to :requester, :class_name => "User"
  belongs_to :helper, :class_name => "User"
end
