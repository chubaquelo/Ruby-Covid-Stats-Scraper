# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require './lib/stats'
require './lib/parse_methods'

describe '#world_stats' do
  let(:wstats) { world_stats }
  it 'return an array' do
    expect(wstats.class).to be(Array)
  end

  it 'array has 3 integer' do
    expect(wstats[0].class).to be(Integer)
  end

  it 'array has 3 integer' do
    expect(wstats[1].class).to be(Integer)
  end

  it 'array has 3 integer' do
    expect(wstats[2].class).to be(Integer)
  end

  it 'array is lenght of 3' do
    expect(wstats.length).to eql 3
  end

  it 'array has no strings' do
    expect(wstats[0]).to not_be(String)
  end

  it 'array has no strings' do
    expect(wstats[1]).to not_be(String)
  end

  it 'array has no strings' do
    expect(wstats[2]).to not_be(String)
  end

end

# rubocop:enable Style/FrozenStringLiteralComment
