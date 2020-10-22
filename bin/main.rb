# rubocop:disable Style/FrozenStringLiteralComment, Metrics/BlockNesting

require '../lib/stats'
require '../lib/parse_methods'
require 'colorize'

world_or_country = ''
chosen_country = ''
country_stats = ''
run = true

puts '--------------------------------------------'.colorize(:yellow)
puts 'Welcome to the Ruby COVID Statistics Scraper'.colorize(:yellow)
puts '*Data by worldometers.info'.center(45).colorize(:yellow)
puts '--------------------------------------------'.colorize(:yellow)

while run
  loop do
    puts 'Please select the data you want to visualize (input 1 or 2)'.colorize(:green)
    puts ''
    puts '1 - World COVID statistics'.colorize(:yellow)
    puts '2 - Data per country'.colorize(:yellow)
    puts ''
    puts 'Option 1 or 2?:'.colorize(:green)
    world_or_country = gets.chomp.to_i
    break if [1, 2].include?(world_or_country)

    puts ''
    puts 'Wrong option, please choose 1 or 2.' unless [1, 2].include?(world_or_country)
  end

  if world_or_country == 1
    # First I need to grab the data with a method here and set it into a variable.
    s = world_stats
    puts ''
    puts 'World COVID Statistics'
    puts 'Until today, registered world data is:'
    puts ''
    puts '----------WORLD STATS-------------'
    puts " Cases: #{s[0]}".center(30).colorize(:blue)
    puts " Deaths: #{s[1]}".center(30).colorize(:red)
    puts " Recovered: #{s[2]}".center(30).colorize(:green)
    puts " Death Rate: #{(s[1].to_f / s[0] * 100).round(2)}%".center(30).colorize(:magenta)
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
      puts 'Wrong option, please choose a number from 1 to 6.' unless [1, 2, 3, 4, 5, 6, 7].include?(chosen_country)
    end

    if [1, 2, 3, 4, 5, 6].include?(chosen_country)
      cs = country_stats(chosen_country)
      puts ''
      puts "#{country_name(chosen_country).capitalize} COVID Statistics"
      puts 'Until today, registered data is:'
      puts ''
      puts "----------#{country_name(chosen_country).upcase.sub('-', ' ')} STATS-------------"
      puts " Cases: #{cs[0]}".center(30).colorize(:blue)
      puts " Deaths: #{cs[1]}".center(30).colorize(:red)
      puts " Recovered: #{cs[2]}".center(30).colorize(:green)
      puts " Death Rate: #{(cs[1].to_f / cs[0] * 100).round(2)}%".center(30).colorize(:magenta)
      puts '----------------------------------'
      puts "*Data by worldometers.info | #{Time.now}"
      puts ''
    elsif chosen_country == 7
      loop do
        puts 'Please type the name of your country (in english):'
        chosen_country = gets.chomp.downcase
        break if url_exists?(chosen_country.sub(' ', '-'))

        puts 'The country you typed is wrong.'
      end
      country_stats = country_stats(chosen_country)
      puts ''
      puts "#{chosen_country.capitalize} COVID Statistics"
      puts 'Until today, registered data is:'
      puts ''
      puts "----------#{chosen_country.upcase} STATS-------------"
      puts " Cases: #{country_stats[0]}".center(30).colorize(:blue)
      puts " Deaths: #{country_stats[1]}".center(30).colorize(:red)
      puts " Recovered: #{country_stats[2].zero? ? 'No Data' : country_stats[2]}".center(30).colorize(:green)
      puts " Death Rate: #{(country_stats[1].to_f / country_stats[0] * 100).round(2)}%".center(30).colorize(:magenta)
      puts '----------------------------------'
      puts "*Data by worldometers.info | #{Time.now}"
      puts ''
    end
  end
  other_search = ''
  until %w[Y N].include?(other_search)
    puts 'Want to make another Search? (Y/N):'
    other_search = gets.chomp.upcase
    run = false if other_search == 'N'
  end
  puts '----------------------------------'
  puts 'Bye!'.center(35).colorize(:yellow)
  puts '----------------------------------'
end

# rubocop:enable Style/FrozenStringLiteralComment, Metrics/BlockNesting
