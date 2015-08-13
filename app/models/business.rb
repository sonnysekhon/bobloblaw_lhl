class Business < ActiveRecord::Base

  # attr_accessor :address, :city, :postal_code, :province, :country, :latitude, :longitude
  geocoded_by :complete_address
  after_validation :geocode #, :if => :address_changed?

  scope :check_query, ->(search) {where("category LIKE ? OR name LIKE ? OR phone LIKE ? OR address LIKE ? OR city LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%").order(featured: :desc)}

  belongs_to :user
  has_one :design
  has_attached_file :photo

  validates_attachment_file_name :photo, :matches => [/png\Z/, /jpe?g\Z/,/gif\Z/]

  def complete_address
    "#{address}, #{city}, #{province}, #{postal_code}, #{country}"
  end

  def gmaps_url
    "https://www.google.com/maps?q=#{latitude},#{longitude}"
  end

  # protected
  #   def self.search(query)
  #     where("category LIKE ? OR name LIKE ? OR phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured IS true")
  #     where("category LIKE ? OR name LIKE ? OR phone LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "AND featured IS false")
  #   end

end