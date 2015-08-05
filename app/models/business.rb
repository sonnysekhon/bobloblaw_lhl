class Business < ActiveRecord::Base
  belongs_to :user
  has_one :layout
  has_one :address
end