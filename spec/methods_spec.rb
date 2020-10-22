require 'nokogiri'
require_relative '../lib/country'
require_relative '../lib/world'

context Country do
  country = Country.new('argentina')
  describe '#cases' do
    it 'return an integer' do
      expect(country.cases).to be(Integer)
    end
  end

  describe '#deaths' do
    it 'return an integer' do
      expect(country.deaths).to be(Integer)
    end
  end

  describe '#recovered' do
    it 'return an integer' do
      expect(country.recovered).to be(Integer)
    end
  end

  describe '#name' do
    it 'returns argentina as country name' do
      expect(country.name).to eql('argentina')
    end
  end

  describe '#country_stats' do
    it 'return an array when pass a number 1' do
      expect(country.country_stats.class).to be(Array)
    end

    it 'return an array when pass a string "argentina"' do
      expect(country.country_stats.class).to be(Array)
    end
  
    it 'array[0] is integer when pass a string "argentina"' do
      expect(country.country_stats[0].class).to be(Integer)
    end
  
    it 'array[1] is integer when pass a string "argentina"' do
      expect(country.country_stats[1].class).to be(Integer)
    end
  
    it 'array[2] is integer when pass a string "argentina"' do
      expect(country.country_stats[2].class).to be(Integer)
    end
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
