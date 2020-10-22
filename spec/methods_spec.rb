# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require './lib/stats'
require './lib/parse_methods'

describe '#world_stats' do
  let(:wstats) { world_stats }
  it 'return an array' do
    expect(wstats.class).to be(Array)
  end

  it 'array has integer in pos [0]' do
    expect(wstats[0].class).to be(Integer)
  end

  it 'array has integer in pos [1]' do
    expect(wstats[1].class).to be(Integer)
  end

  it 'array has integer in pos [2]' do
    expect(wstats[2].class).to be(Integer)
  end

  it 'array is lenght of 3' do
    expect(wstats.length).to eql 3
  end

  it 'array has no strings on pos [0]' do
    expect(wstats[0]).to_not be(String)
  end

  it 'array has no strings on pos [1]' do
    expect(wstats[1]).to_not be(String)
  end

  it 'array has no strings on pos [2]' do
    expect(wstats[2]).to_not be(String)
  end

end

describe '#country_stats' do
  it 'return an array when pass a number 1' do
    expect(country_stats(1).class).to be(Array)
  end

  it 'return an array when pass a number 5' do
    expect(country_stats(5).class).to be(Array)
  end

  it 'return an array when pass a string "argentina"' do
    expect(country_stats('argentina').class).to be(Array)
  end

  it 'array[0] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[0]).to be(Integer)
  end

  it 'array[1] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[1]).to be(Integer)
  end

  it 'array[2] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[2]).to be(Integer)
  end

  it 'return an array when pass a string "el salvador"' do
    expect(country_stats('el salvador').class).to be(Array)
  end

  it 'return false when pass a "badcountryname" string' do
    expect(country_stats('badcountryname')).to eql false
  end

  it 'return false when pass a number not 1 to 6' do
    expect(country_stats(7)).to eql false
  end

end

# rubocop:enable Style/FrozenStringLiteralComment
