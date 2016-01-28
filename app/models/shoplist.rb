class Shoplist < ActiveRecord::Base
  belongs_to :requester, :class_name => "User", :foreign_key => "requester_id"
  belongs_to :helper, :class_name => "User", :foreign_key => "helper_id"
end
