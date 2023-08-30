# frozen_string_literal: true

# Instructions and other game strings
module TextInstructions
  def self.welcome
    puts <<-HEREDOC
  ================================
  Welcome to \e[35mTic Tac Toe.\e[0m

  ================================
    HEREDOC
  end

  def marker_instructions
    puts <<-HEREDOC
    Press x or o to select your marker
    HEREDOC
  end
end
