require_relative 'instructions'

# Board grid and methods
class TicTacToe
  attr_accessor :rows, :winner

  @@grid = Array.new(9, ' ')

  def initialize
    @winner = ''
  end

  def print_board
    @@grid.each_with_index do |_col, index|
      print "\e[30;44m #{@@grid[index]} | \e[0m"
      case index
      when 2, 5, 8
        print "\n"
      end
    end
  end

  def self.grid
    @@grid
  end

  WINNING_COMBO =
    # horizontal
    [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [6, 4, 2]
    ].freeze

  def place_marker(marker, tile)
    # cancel if tile is already filled
    tile = tile.to_i
    return if @@grid[tile - 1] != ' '

    @@grid[tile - 1] = marker
  end

  def open?(pick)
    index = pick.to_i

    @@grid[index - 1] == ' '
  end

  def full?
    @@grid.all? do |slot|
      ['x', 'o'].include?(slot)
    end
  end

  def check_winner?(player)
    # puts 'Checking for a winner'
    WINNING_COMBO.each do |row|
      next unless @@grid.values_at(*row).none? { |el| el == ' ' }

      el = row.map { |index| @@grid[index] }

      if el.all? { |el| el == player.marker }
        # puts "#{player.name} wins!"
        return true
      end
    end
    # puts 'No winner found'
    false
  end

  # end class TicTacToe
end
