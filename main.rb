# frozen_string_literal: true

require_relative 'lib/game'

def play_game
  connect_four = Game.new
  connect_four.play_game
end

play_game
