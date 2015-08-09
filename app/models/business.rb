class Business < ActiveRecord::Base
  belongs_to :user
  has_one :design

  protected
    def self.search(query)
      where("category LIKE ? OR name LIKE ? OR phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured IS true")
      where("category LIKE ? OR name LIKE ? OR phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured IS false")
    end

end