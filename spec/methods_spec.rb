# rubocop:disable Style/FrozenStringLiteralComment

require 'nokogiri'
require '../lib/stats'
require '../lib/parse_methods'

describe '#world_stats' do
  let(:wstats) { world_stats }
  it '#book_data_array is returned containing book data' do
    expect(wstats).to be(Array)
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
