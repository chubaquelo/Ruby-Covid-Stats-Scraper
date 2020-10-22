require '../lib/get_stats'
require '../lib/parse_methods'

world_or_country = ''
chosen_country = ''
world_stats = ''
country_stats = ''
run = true

puts '--------------------------------------------'
puts 'Welcome to the Ruby COVID Statistics Scraper'
puts '*Data by worldometers.info'.rjust(35)
puts '--------------------------------------------'

while run
    loop do
        puts 'Please select the data you want to visualize (input 1 or 2)'
        puts ''
        puts '1 - World COVID statistics'
        puts '2 - Data per country'
        puts ''
        puts 'Option 1 or 2?:'
        world_or_country = gets.chomp.to_i
        break if [1,2].include?(world_or_country)
        puts ''
        puts 'Wrong option, please choose 1 or 2.' if ![1,2].include?(world_or_country)
    end

    if world_or_country == 1
        # First I need to grab the data with a method here and set it into a variable.
        world_stats = get_world_stats
        puts ''
        puts 'World COVID Statistics'
        puts 'Until today, registered world data is:'
        puts ''
        puts '----------WORLD STATS-------------'
        puts "| Cases: #{world_stats[0]}"
        puts "| Deaths: #{world_stats[1]}"
        puts "| Recovered: #{world_stats[2]}"
        puts "| Death Rate: #{(world_stats[1].to_f/world_stats[0].to_f*100).round(2)}%"
        puts '----------------------------------'
        puts "*Data by worldometers.info | #{Time.now}"
        puts ''

    elsif world_or_country == 2
        loop do
            puts 'Please select the country you want to know covid stats:'
            puts '--------------------------------------------'
            puts '1 - Argentina'
            puts '2 - Serbia'
            puts '3 - Iraq'
            puts '4 - Congo'
            puts '5 - Nigeria'
            puts '6 - United States'
            puts '7 - Type another country....'
            puts '--------------------------------------------'
            puts 'Select a number: '    
            chosen_country = gets.chomp.to_i
            break if (1..7).include?(chosen_country)
            puts ''
            puts 'Wrong option, please choose a number from 1 to 6.' if ![1, 2, 3, 4, 5, 6, 7].include?(chosen_country)
        end
        
        if [1, 2, 3, 4, 5, 6].include?(chosen_country)
        country_stats = get_country_stats(chosen_country)
        puts ''
        puts "#{get_country_name(chosen_country).capitalize} COVID Statistics"
        puts 'Until today, registered data is:'
        puts ''
        puts "----------#{get_country_name(chosen_country).upcase.sub('-',' ')} STATS-------------"
        puts "| Cases: #{country_stats[0]}"
        puts "| Deaths: #{country_stats[1]}"
        puts "| Recovered: #{country_stats[2]}"
        puts "| Death Rate: #{(country_stats[1].to_f/country_stats[0].to_f*100).round(2)}%"
        puts '----------------------------------'
        puts "*Data by worldometers.info | #{Time.now}"
        puts ''

        elsif chosen_country == 7
            
            begin
                loop do
                puts 'Please type the name of your country (in english):'
                chosen_country = gets.chomp.downcase
                break if url_exists?(chosen_country.sub(' ','-'))
                puts 'The country you typed is wrong.'
                end
                country_stats = get_country_stats(chosen_country)
                puts ''
                puts "#{chosen_country.capitalize} COVID Statistics"
                puts 'Until today, registered data is:'
                puts ''
                puts "----------#{chosen_country.upcase} STATS-------------"
                puts "| Cases: #{country_stats[0]}"
                puts "| Deaths: #{country_stats[1]}"
                puts "| Recovered: #{country_stats[2] == 0 ? 'No Data' : country_stats[2]}"
                puts "| Death Rate: #{(country_stats[1].to_f/country_stats[0].to_f*100).round(2)}%"
                puts '----------------------------------'
                puts "*Data by worldometers.info | #{Time.now}"
                puts ''
            rescue
                puts "ERROR: Country name must be correct. Try again"
            end
            
        end
    end
    other_search = ''
    while !%w[Y N].include?(other_search)
      puts 'Want to make another Search? (Y/N):'
      other_search = gets.chomp.upcase
      run = false if other_search == 'N'
    end
    puts ''
    puts '-------------------'
end