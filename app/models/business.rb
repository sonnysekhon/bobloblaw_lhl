class Business < ActiveRecord::Base
  belongs_to :user
  has_one :design
end