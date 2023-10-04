# Tests for Player class
require_relative '../lib/player'

describe Player do
  before do
    allow(player).to receive(:prompt)
    allow(player).to receive(:setup_name)
    allow(player).to receive(:set_marker)
  end

  subject(:player) { described_class.new }

  describe '#setup_name' do
    it 'Registers a name properly' do
      allow(player).to receive(:setup_name).and_call_original
      allow(player).to receive(:prompt).and_return('Taro')

      player.setup_name

      expect(player.name).to eq('Taro')
    end
  end

  describe '#set_marker' do
    it 'sets marker when other player is blank' do
      allow(player).to receive(:prompt).and_return('x')
      allow(player).to receive(:set_marker).and_call_original

      player.set_marker

      expect(player.marker).to eq 'x'
    end
    it 'Assigns other marker when a marker has already been picked' do
      Player.other_player = 'x'
      allow(player).to receive(:set_marker).and_call_original

      player.set_marker

      expect(player.marker).to eq 'o'
    end
  end
end
