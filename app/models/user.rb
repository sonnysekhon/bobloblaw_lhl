class User < ActiveRecord::Base
  has_one :business
  # has_secure_password
  # validates :firstname, presence: true
  # validates :lastname, presence: true
  # validates :email, presence: true, uniqueness: true

  def full_name
    "#{firstname} #{lastname}"
  end

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.photo = auth_hash['info']['image']
      #binding.pry
      user.save!
      user
    end
  end

end