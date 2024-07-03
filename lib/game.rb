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
    @turn = 0
  end

  def play_game
    display_intro
    set_players_name
    run_game_loop
  end

  def set_players_name
    @player_one.name = prompt_for_player_name(1)
    @player_two.name = prompt_for_player_name(2)
  end

  def run_game_loop
    loop do
      increment_turn
      display_board
      player_move(current_player)
      display_board

      break if game_over?
    end
  end

  def increment_turn
    @turn += 1
  end

  def player_move(player)
    display_player_turn(player)
    column = prompt_for_column_choice
    place_token(player, column)
  end

  def game_over?
    winner = check_for_winner

    if winner
      announce_winner(winner)
      return true
    elsif draw?
      announce_draw
      return true
    end

    false
  end

  private

  def check_for_winner
    if @board.winning_move?(@player_one.token)
      @player_one
    elsif @board.winning_move?(@player_two.token)
      @player_two
    end
  end

  def announce_draw
    puts "It's a draw!"
  end

  def announce_winner(player)
    puts "#{player.name} wins!"
  end

  def draw?
    @turn >= 42
  end

  def place_token(player, column)
    @board.place_token(column, player.token)
  end

  def display_player_turn(player)
    puts "#{player.name}'s turn (#{player.token})"
  end

  def prompt_for_column_choice
    loop do
      puts 'Enter column choice [1-7]:'
      column = gets.chomp.to_i - 1
      return column if (0..6).include?(column) && @board.column_not_full?(column)

      puts 'Invalid column choice. Please choose again.'
    end
  end

  def current_player
    @turn.odd? ? @player_one : @player_two
  end

  def display_board
    display_game_title
    @board.display_board
  end

  def display_game_title
    puts '  _                      ___          '.yellow
    puts ' / )           _  _ _/  (_          _ '.yellow
    puts '(__  () /) /) (- (  /   /    () (/ /  '.yellow
    puts ''
  end

  def prompt_for_player_name(player_number)
    puts "Enter player #{player_number}'s name:"
    gets.chomp
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
