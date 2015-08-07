class Business < ActiveRecord::Base
  belongs_to :user
  has_one :layout


  protected
    def self.search(query)
      where("category LIKE ? OR name LIKE ? or phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured is true")
      where("category LIKE ? OR name LIKE ? or phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured is false")
    end


    #featured first (true or false)

    #category
    #name
    #phone
    #

end