class Business < ActiveRecord::Base
  belongs_to :user
  has_one :design

  protected
    def self.search(query)
      where("category LIKE ? OR name LIKE ? or phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured is true")
      where("category LIKE ? OR name LIKE ? or phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured is false")
    end

end