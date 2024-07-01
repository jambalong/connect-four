# frozen_string_literal: true

require_relative 'token'

# A grid with 6 rows and 7 columns
class Board
  include Token

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_token } }
  end

  def display_board
    @grid.each do |row|
      puts row.join(' ')
    end
    puts (1..7).to_a.join(' ')
  end

  def column_not_full?(column)
    @grid[0][column] = empty_token
  end
end
