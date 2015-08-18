# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

desc "Scrape And Populate DB"
task :scraper => :environment do
  require 'nokogiri'
  require 'open-uri'
  # url_local = File.read('/Users/sonnysekhon/Downloads/yoga_bc.html')  
  url = "http://www.yellowpages.ca/search/si/1/gym/Vancouver%2C%20BC"
  url_bc = "http://www.yellowpages.ca/search/si/1/gym/%20BC"
  url_bc_yoga = "http://www.yellowpages.ca/search/si/1/yoga/bc"
  doc = Nokogiri::HTML(open(url_bc_yoga))
  doc.css(".listingInfo").each do |item|
    name = item.css("div h3 a").text
    phone = item.css("div h4 a span").text
    address = item.css("div span span[itemprop='streetAddress']").text
    city = item.css("div span span[itemprop='addressLocality']").text
    province = item.css("div span span[itemprop='addressRegion']").text
    postal_code = item.css("div span span[itemprop='postalCode']").text
    if !item.css("div ul li:last-child a[itemprop='url']").empty?
      website = item.css("div ul li:last-child a[itemprop='url']").attr('href').to_s.gsub("/gourl?", "")
    else
      website = nil
    end
    if !item.css("div a img").empty?
      photo_scraped = item.css("div a img").attr('src').value
    else
      photo_scraped = nil
    end
    
    Business.create(name: name, phone: phone, photo_scraped: photo_scraped, website: website, address: address, city: city, province: province, postal_code: postal_code)
  end
end
