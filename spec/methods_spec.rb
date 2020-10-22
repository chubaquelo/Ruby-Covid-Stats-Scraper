# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require_relative './lib/country'
require_relative './lib/world'

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

  it 'return an array when pass a string "argentina"' do
    expect(country_stats('argentina').class).to be(Array)
  end

  it 'array[0] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[0].class).to be(Integer)
  end

  it 'array[1] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[1].class).to be(Integer)
  end

  it 'array[2] is integer when pass a string "argentina"' do
    expect(country_stats('argentina')[2].class).to be(Integer)
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

describe '#country_name' do
  it 'returns error message when pass 8' do
    expect(country_name(8)).to eql 'Incorrect country number. Should be 1 to 6'
  end

  it 'returns error message when pass a string' do
    expect(country_name('string')).to eql 'Incorrect country number. Should be 1 to 6'
  end

  it 'returns argentina when pass a 1' do
    expect(country_name(1)).to eql 'argentina'
  end

  it 'returns congo when pass a 4' do
    expect(country_name(4)).to eql 'congo'
  end
end

describe '#url_exists?' do
  it 'return true when pass argentina' do
    expect(url_exists?('argentina')).to eql true
  end

  it 'return false when pass nonexist country' do
    expect(url_exists?('nonexist')).to eql false
  end

  it 'return true when pass el-salvador country' do
    expect(url_exists?('el-salvador')).to eql true
  end

  it 'return false when pass el salvador country' do
    expect(url_exists?('el salvador')).to eql false
  end

  it 'return false when pass a number' do
    expect(url_exists?('2')).to eql false
  end
end

describe '#parse_world_page' do
  it 'returns not nil' do
    expect(parse_world_page).not_to be_nil
  end
end

describe '#parse_country_page' do
  it 'returns not nil' do
    expect(parse_country_page('argentina')).not_to be_nil
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
