require 'nokogiri'
require 'httparty'

def parse_url(url)
  unparsed_page = HTTParty.get(url)
  Nokogiri::HTML(unparsed_page)
end