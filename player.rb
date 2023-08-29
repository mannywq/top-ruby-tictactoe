# Basic player setup
class Player
  attr_accessor :marker, :name, :picks, :type

  @@other_player = ''

  def initialize(name = '', type = 'human')
    @marker = marker
    @name = name
    @type = type
    @picks = []

    setup_name
    set_marker
  end

  def prompt(*)
    print(*)
    gets.chomp
  end

  def setup_name
    return if @name != ''

    @name = prompt 'What is your name? '
  end

  def set_marker
    if @@other_player == ''
      @marker = prompt 'Pick your marker (x or o) ' until %w[x o].include?(@marker)
      @@other_player = @marker
    else
      @marker = @@other_player == 'x' ? 'o' : 'x'
      puts "Other player has picked #{@@other_player}. Your marker is #{marker}"
    end
  end
end
