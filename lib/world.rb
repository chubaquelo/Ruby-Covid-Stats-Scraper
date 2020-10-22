require 'nokogiri'
require 'open-uri'
require 'net/http'

class Country
    attr_reader :name

    def initialize(name)
        @name = name
    end

    def get_cases
      country_stats[0]
    end

    def get_deaths
        country_stats[1]
    end

    def get_recovered
        country_stats[2]
    end

    private
    def parse_world_page
        Nokogiri::HTML(URI.open('https://www.worldometers.info/coronavirus/'))
    end

    def country_stats
        if @name.is_a?(Integer)
          @name = country_name(@name)
          return false if @name == 'Incorrect country number. Should be 1 to 6'
        elsif @name.is_a?(String)
          @name.gsub!(' ', '-')
          return false unless url_exists?("https://www.worldometers.info/coronavirus/country/#{@name}")
        end
        f = parse_country_page(@name)
        g = f.css('div[class="maincounter-number"]')
        arr = []
        g.each do |div|
          arr.push(/(\d{1,3},?\d{1,3},?\d{1,3}|\d{2})/.match(div.to_s).to_s.gsub(',','').to_i)
        end
        arr
      end

    def url_exists?(country)
        begin
          f = URI.open("https://www.worldometers.info/coronavirus/country/#{country}").read
          return false if f.include?('Not Found')
        rescue StandardError
          return false
        end
        true
      end
end