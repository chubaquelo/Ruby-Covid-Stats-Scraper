# rubocop:disable Layout/SpaceAfterComma, Style/FrozenStringLiteralComment

require_relative 'parse_methods'

def world_stats
  f = parse_world_page
  g = f.css('div[class="maincounter-number"]')
  # Extract number from DIV using Regexp
  arr = []
  g.each do |div|
    arr.push(/\d{1,2},\d{3},\d{3}/.match(div.to_s).to_s.gsub(',','').to_i)
  end
  # The result is an array with 3 numbers: Cases, Deaths and Recovered
  arr
end

def country_stats(country)
  country = country_name(country) if country.is_a?(Integer)
  country.gsub!(' ', '-') if country.is_a?(String)
  f = parse_country_page(country)
  g = f.css('div[class="maincounter-number"]')
  # Extract number from DIV using Regexp
  arr = []
  g.each do |div|
    arr.push(/(\d{1,3},?\d{1,3},?\d{1,3}|\d{2})/.match(div.to_s).to_s.gsub(',','').to_i)
  end
  # The result is an array with 3 numbers: Cases, Deaths and Recovered
  arr
end

def country_name(country_number)
  countries = { 1 => 'argentina', 2 => 'serbia', 3 => 'iraq', 4 => 'congo', 5 => 'nigeria', 6 => 'us' }
  countries.key?(country_number) ? countries[country_number] : 'Incorrect country number. Should be 1 to 6'
end

# rubocop:enable Layout/SpaceAfterComma, Style/FrozenStringLiteralComment
