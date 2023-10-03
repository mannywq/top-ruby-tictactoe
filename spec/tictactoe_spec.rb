require_relative '../lib/tictactoe'

describe TicTacToe do
  describe '#check_winner?' do
    subject(:game_board) { described_class.new }
    let(:player) { double('player', marker: 'o') }

    context 'It finds a winning combination' do
      it 'Returns true when a winner is found' do
        TicTacToe.grid = ['o', 'o', 'o', 'x', 'x', 'o', ' ', ' ', ' ']
        puts "Board is: #{TicTacToe.grid}"
        res = game_board.check_winner?(player)
        expect(res).to eq true
      end
    end
    context 'It handles non winning combinations' do
      it 'returns false when board is empty' do
        TicTacToe.grid = [' ', '', '', ' ', ' ', ' ', ' ', ' ', ' ']
        puts "Board is: #{TicTacToe.grid}"
        res = game_board.check_winner?(player)
        expect(res).to eq false
      end
    end
  end

  describe '#place_marker' do
    subject(:game_board) { described_class.new }
    let(:player) { double(marker: 'o') }

    context 'A marker should be placed in available slots' do
      it 'Places a marker when a slot is available' do
        TicTacToe.grid = [' ', '', '', ' ', ' ', ' ', ' ', ' ', ' ']

        game_board.place_marker(player.marker, 1)

        expect(TicTacToe.grid[0]).to eq player.marker
      end

      it 'Does not overwrite if a marker already exists in slot' do
        TicTacToe.grid = ['o', 'x', 'o', 'x', 'x', 'o', ' ', ' ', ' ']

        game_board.place_marker(player.marker, 2)

        expect(TicTacToe.grid[1]).to eq 'x'
      end
    end
  end
  describe '#open?' do
    subject(:game_board) { described_class.new }
    let(:player) { double(marker: 'o') }
    before do
      TicTacToe.grid = ['o', 'x', 'o', 'x', 'x', 'o', ' ', ' ', ' ']
    end

    context 'It should return true or false depending on whether a marker has been placed in position' do
      it 'Returns true when a slot is open' do
        expect(game_board.open?(7)).to be true
      end
      it 'Returns false when a slot is full' do
        expect(game_board.open?(1)).to be false
      end
    end
  end

  describe '#full?' do
    subject(:game_board) { described_class.new }
    let(:player) { double(marker: 'o') }

    context 'It describes if the board has been filled' do
      it 'Returns true when the board is full' do
        TicTacToe.grid = ['o', 'x', 'o', 'x', 'x', 'o', 'x', 'o', 'x']
        expect(game_board.full?).to be true
      end
      it 'Returns false when there are open slots on the board' do
        TicTacToe.grid = ['o', 'x', 'o', 'x', 'x', 'o', ' ', ' ', ' ']
        expect(game_board.full?).to be false
      end
    end
  end
end
