def get_country_stats(country_number); end

def get_country_name(country_number)

  case country_number.is_a?(Integer)
  when country_number == 1
      name = 'argentina'
  when country_number == 2
      name = 'Serbia'
  when country_number == 3
      name = 'iraq'
  when country_number == 4
      name = 'congo'
  when country_number == 5
      name = 'nigeria'
  when country_number == 6
      name = 'us'
  else
      name = 'Incorrect country number. Should be 1 to 6r'
  end
  name
end
