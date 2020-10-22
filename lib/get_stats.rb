require '../lib/parse_methods'

def get_world_stats
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

def get_country_stats(country)
    country = get_country_name(country) if country.is_a?(Integer)
    country.gsub!(' ','-') if country.is_a?(String)
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

def get_country_name(country_number)

  case country_number.is_a?(Integer)
  when country_number == 1
      name = 'argentina'
  when country_number == 2
      name = 'serbia'
  when country_number == 3
      name = 'iraq'
  when country_number == 4
      name = 'congo'
  when country_number == 5
      name = 'nigeria'
  when country_number == 6
      name = 'us'
  else
      name = 'Incorrect country number. Should be 1 to 6'
  end
  name
end