# rubocop:disable Style/FrozenStringLiteralComment, Metrics/BlockNesting

# require_relative '../lib/stats'
# require_relative '../lib/parse_methods'
require_relative '../lib/country'
require_relative '../lib/world'
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
    world = World.new
    cases = world.get_cases
    deaths = world.get_deaths
    recov = world.get_recovered
    puts ''
    puts 'World COVID Statistics'
    puts 'Until today, registered world data is:'
    puts ''
    puts '----------WORLD STATS-------------'
    puts " Cases: #{cases}".center(30).colorize(:blue)
    puts " Deaths: #{deaths}".center(30).colorize(:red)
    puts " Recovered: #{recov}".center(30).colorize(:green)
    puts " Death Rate: #{(deaths.to_f / cases * 100).round(2)}%".center(30).colorize(:magenta)
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
      country = Country.new(chosen_country)
      puts ''
      puts "#{country.name.capitalize} COVID Statistics"
      puts 'Until today, registered data is:'
      puts ''
      puts "----------#{country.name.upcase.sub('-', ' ')} STATS-------------"
      puts " Cases: #{country.get_cases}".center(30).colorize(:blue)
      puts " Deaths: #{country.get_deaths}".center(30).colorize(:red)
      puts " Recovered: #{country.get_recovered}".center(30).colorize(:green)
      puts " Death Rate: #{(country.get_deaths.to_f / country.get_cases * 100).round(2)}%".center(30).colorize(:magenta)
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
      country = Country.new(chosen_country)
      puts ''
      puts "#{chosen_country.capitalize} COVID Statistics"
      puts 'Until today, registered data is:'
      puts ''
      puts "----------#{country.name.upcase.sub('-', ' ')} STATS-------------"
      puts " Cases: #{country.get_cases}".center(30).colorize(:blue)
      puts " Deaths: #{country.get_deaths}".center(30).colorize(:red)
      puts " Recovered: #{country.get_recovered.zero? ? 'No Data' : country.get_recovered}".center(30).colorize(:green)
      puts " Death Rate: #{(country.get_deaths.to_f / country.get_cases * 100).round(2)}%".center(30).colorize(:magenta)
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
