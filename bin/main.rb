require '../lib/world_stats'
require '../lib/get_country_stats'
require '../lib/parse_methods'

world_or_country = ''
chosen_country = ''
world_stats = ''
country_stats = ''

puts '--------------------------------------------'
puts 'Welcome to the Ruby COVID Statistics Scraper'
puts '*Data by worldometers.info'.rjust(35)
puts '--------------------------------------------'
puts 'Please select the data you want to visualize (input 1 or 2)'
puts ''
loop do
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
    puts '--------------------------------------------'
    puts '| Coronavirus Cases: #{get_world_stats[0]}'
    puts '| Deaths: #{get_world_stats[1]}'
    puts '| Recovered: #{get_world_stats[2]}'
    puts '--------------------------------------------'

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
    elsif chosen_country == 7
        puts 'Please type the name of your country'
        chosen_country = gets.chomp.downcase
    end

end