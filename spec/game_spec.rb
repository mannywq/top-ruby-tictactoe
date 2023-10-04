require_relative '../lib/game'

describe Game do
  let(:p1) { double('p1', name: 'Taro', type: 'human', marker: 'o') }
  let(:p2) { double('p2', { name: 'Yuka', type: 'human', marker: 'x' }) }

  let(:board) { double('board') }
  subject(:game) { described_class.new(p1, p2, board) }

  before do
    allow(game).to receive(:make_move)

    allow(board).to receive(:full?).and_return(false, false, true)
    allow(board).to receive(:print_board)
    allow(board).to receive(:check_winner?).and_return(false, true)
    allow(board).to receive(:winner).and_return(p1)
  end

  describe '#initialize' do
    it 'sets @current_player to p1' do
      expect(game.current_player).to eq p1
    end
  end
  describe '#play' do
    it 'It plays the game until a winner is found' do
      expect(board).to receive(:print_board)
      expect(p1).to receive(:type).and_return('human')

      expect(game).to receive(:print_winner)
      game.play

      # expect(game).to have_received(:change_turn)
    end
  end

  describe '#prompt' do
    it 'Calls print' do
      allow($stdout).to receive(:print)
      allow(game).to receive(:gets).and_return 'x'

      input = game.prompt('Make a move player: ')

      expect(input).to eq 'x'
    end
  end

  describe '#print_winner' do
    it 'Prints the name of the current player' do
      game.print_winner
      expect { game.print_winner }.to output("The winner is Taro!\n").to_stdout
    end
  end

  describe '#change_turn' do
    it 'changes the active player' do
      game.change_turn

      expect(game.current_player).to eq p2
    end
  end
  describe '#make_move' do
    before do
      allow(game).to receive(:make_move).and_call_original
      allow(game).to receive(:prompt).and_return('1')

      allow(board).to receive(:open?).and_return(true)

      allow(board).to receive(:place_marker)
      allow(board).to receive(:grid).and_return 'x'
    end
    it 'Calls place marker if the slot is open' do
      game.make_move

      expect(board).to have_received(:place_marker)
    end
    context 'Dealing with errors and invalid input' do
      it 'Prints an error message if the slot is taken' do
        # allow(game).to receive(:puts)
        allow(board).to receive(:open?).and_return(false, true)
        output = StringIO.new
        $stdout = output
        game.make_move

        expect(output.string).to include('1 is taken. Current value is x')
        $stdout = STDOUT
      end
    end
  end
end
