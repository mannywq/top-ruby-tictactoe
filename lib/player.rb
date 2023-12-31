# Basic player setup
class Player
  attr_accessor :marker, :name, :picks, :type

  @@other_player = ''

  def initialize(name = '', type = 'human')
    @marker = marker
    @name = name
    @type = type
    @picks = []
  end

  def self.other_player
    @@other_player
  end

  def self.other_player=(val)
    @@other_player = val
  end

  def prompt(*args)
    print(*args)
    gets.chomp
  end

  def setup_name
    return if @name != ''

    @name = prompt 'What is your name? '
  end

  def set_marker
    if @@other_player == ''
      @marker = prompt 'Pick your marker (x or o) ' until ['x', 'o'].include?(@marker)
      @@other_player = @marker
    else
      @marker = @@other_player == 'x' ? 'o' : 'x'
      puts "Other player has picked #{@@other_player}. Your marker is #{marker}"
    end
  end
end
