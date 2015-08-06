require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.yellowpages.ca/search/si/1/gym/Vancouver%2C%20BC"
url_bc = "http://www.yellowpages.ca/search/si/1/gym/%20BC"
doc = Nokogiri::HTML(open(url))
doc.css(".listingInfo").each do |item|
  name = item.css("div h3 a").text
  phone = item.css("div h4 a span").text
  street_address = item.css("div span span[itemprop='streetAddress']").text
  city = item.css("div span span[itemprop='addressLocality']").text
  province = item.css("div span span[itemprop='addressRegion']").text
  postal_code = item.css("div span span[itemprop='postalCode']").text
  if !item.css("div ul li:last-child a[itemprop='url']").empty?
    website = item.css("div ul li:last-child a[itemprop='url']").attr('href').to_s.gsub("/gourl?", "")
  end
  if !item.css("div a img").empty?
    image = item.css("div a img").attr('src')
  end
  puts "#{name} - #{phone} - #{street_address}, #{city}, #{province}, #{postal_code}, #{website}, #{image}}"
end