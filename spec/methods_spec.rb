# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require_relative './lib/stats'
require_relative './lib/parse_methods'

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
end

# rubocop:enable Style/FrozenStringLiteralComment
