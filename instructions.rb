# frozen_string_literal: true

# Instructions and other game strings
module TextInstructions
  def player_setup
    puts '<<-HEREDOC
  Welcome to \e[35mTic Tac Toe.\e[0m Type 1 or 2 to select an option below.

  1) Play against another human
  2) Play against the computer

    HEREDOC'
  end

  def marker_instructions
    puts '<<-HEREDOC
    Press x or o to select your marker
    HEREDOC'
  end
end
