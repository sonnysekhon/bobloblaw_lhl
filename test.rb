require 'rubygems'
require 'nokogiri'
require 'open-uri'
url = "http://www.yellowpages.ca/search/si/1/gym/Vancouver%2C%20BC"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text