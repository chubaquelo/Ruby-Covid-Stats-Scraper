# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require 'open-uri'
require 'net/http'

def url_exists?(country)
  begin
    f = URI.open("https://www.worldometers.info/coronavirus/country/#{country}").read
    return false if f.include?('Not Found')
  rescue StandardError
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

# rubocop:enable Style/FrozenStringLiteralComment
