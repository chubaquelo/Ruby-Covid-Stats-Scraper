# rubocop:disable Style/FrozenStringLiteralComment

require './lib/stats'
require './lib/parse_methods'

describe Stats do
  let(:ws) { world_stats }
  describe '#world_stats' do
    it 'return an array with 3 integers' do
      expect(:ws).to be_an(Array)
    end
  end
end

# rubocop:enable Style/FrozenStringLiteralComment
