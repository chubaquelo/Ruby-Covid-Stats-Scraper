require 'nokogiri'
require 'open-uri'
require 'net/http'

def parse_url(url)
  doc = Nokogiri::HTML(URI.open(url))
end

def url_exists?(country)
  begin
    f = URI.open("https://www.worldometers.info/coronavirus/country/#{country}").read
    return false if f.include?('Not Found')
  rescue
    return false
  end
  true
end

def parse_world_page
  Nokogiri::HTML(URI.open('https://www.worldometers.info/coronavirus/'))
end

def parse_country_page(country)
  Nokogiri::HTML(URI.open("https://www.worldometers.info/coronavirus/country/#{country}"))
end
