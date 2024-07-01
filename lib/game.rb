# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'token'

# Connect Four
class Game
  attr_reader :player_one, :player_two

  include Token

  def initialize
    @board = Board.new
    @player_one = Player.new(red_token)
    @player_two = Player.new(blue_token)
  end

  def play_game
    display_intro
    set_players_name
  end

  def set_players_name
    player_one.name = get_player_name(1)
    player_two.name = get_player_name(2)
  end

  private

  def get_player_name(player_number)
    puts "Enter player #{player_number}'s name:"
    player_name = gets.chomp
    player_name
  end

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
