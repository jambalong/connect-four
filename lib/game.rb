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
end
