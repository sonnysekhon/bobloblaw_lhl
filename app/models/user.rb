class User < ActiveRecord::Base
  has_one :business
  has_secure_password
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true, uniqueness: true

end