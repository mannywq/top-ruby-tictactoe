require_relative './tictactoe'

class Game
  attr_accessor :current_player, :players

  def initialize(p1, p2, board = TicTacToe.new)
    @game_over = false
    @turn = 0
    @players = [p1, p2]
    @current_player = p1
    @winner = nil
    @board = board
  end

  def prompt(*args)
    print(*args)
    gets.chomp
  end

  def play
    until @board.full?

      @board.print_board

      if @current_player.type == 'cpu'

        # /cpumake_cpu_move
      else
        make_move
      end

      break if @board.check_winner?(@current_player)

      change_turn
    end
    @winner = @board.winner
    print_winner
  end

  def print_winner
    puts "The winner is #{@current_player.name}!"
  end

  def change_turn
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def gen_tile
    rand(grid.length) + 1
  end

  # def make_cpu_move
  #   tile = gen_tile until TicTacToe.grid[tile] == ' '
  #   puts "CPU wants #{tile}"

  #   @board.place_marker(@current_player.marker, tile)

  #   @current_player.picks << tile

  #   puts "CPU picked #{tile}"
  # end

  def make_move
    move = prompt "Make your move #{@current_player.name}: "

    make_move unless (1..9).include?(move.to_i)

    if @board.open? move

      puts "#{@current_player.name} picks #{move}"

      @board.place_marker(@current_player.marker, move)

    else

      index = move.to_i
      puts "#{move} is taken. Current value is #{@board.grid[index - 1]}"

      make_move

    end
  end
end
