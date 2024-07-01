# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'token'

# Connect Four
class Game
  include Token

  def initialize
    @board = Board.new
    @player_one = Player.new(red_token)
    @player_two = Player.new(blue_token)
  end

  def play_game
    display_intro
  end

  private

  def display_intro
    system 'clear'
    puts <<~HEREDOC
        Welcome to Connect Four!

        This is a two player game.
        Form a line in any direction with four tokens to win

        Enjoy the game! [Press Enter]
    HEREDOC
    gets.chomp
    system 'clear'
  end
end
