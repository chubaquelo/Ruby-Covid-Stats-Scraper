require 'nokogiri'
require_relative '../lib/country'
require_relative '../lib/world'

context Country do
  country = Country.new('argentina')
  contry_2 = Country.new(1)
  describe '#cases' do
    it 'return an integer' do
      expect(country.cases.class).to be(Integer)
    end
  end

  describe '#deaths' do
    it 'return an integer' do
      expect(country.deaths.class).to be(Integer)
    end
  end

  describe '#recovered' do
    it 'return an integer' do
      expect(country.recovered.class).to be(Integer)
    end
  end

  describe '#name' do
    it 'returns argentina as country name' do
      expect(country.name).to eql('argentina')
    end
    it 'returns argentina as country name' do
      expect(country_2.name).to eql('argentina')
    end
  end
end

context World do
  world = World.new
  describe '#cases' do
    it 'return an integer' do
      expect(world.cases.class).to be(Integer)
    end
  end

  describe '#deaths' do
    it 'return an integer' do
      expect(world.deaths.class).to be(Integer)
    end
  end

  describe '#recovered' do
    it 'return an integer' do
      expect(world.recovered.class).to be(Integer)
    end
  end

  describe '#name' do
    it 'returns world as world name' do
      expect(world.name).to eql('world')
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
