require 'nokogiri'
require 'open-uri'
require 'net/http'

class World
  attr_reader :name  
  def initialize
    @name = 'world'
  end  
  def get_cases
    world_stats[0]
  end  
  def get_deaths
    world_stats[1]
  end  
  def get_recovered
    world_stats[2]
  end  
  private
  def parse_world_page
    Nokogiri::HTML(URI.open('https://www.worldometers.info/coronavirus/'))
  end  
  def world_stats
    f = parse_world_page
    g = f.css('div[class="maincounter-number"]')
    arr = []
    g.each do |div|
      arr.push(/\d{1,2},\d{3},\d{3}/.match(div.to_s).to_s.gsub(',','').to_i)
    end
    arr
  end
end
