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

  def token_at(row, column)
    @grid[row][column]
  end

  def column_not_full?(column)
    @grid[0][column] == empty_token
  end

  def place_token(column, token)
    row = next_available_row(column)
    @grid[row][column] = token
  end

  def winning_move?(token)
    return true if horizontal_win?(token)

    return true if vertical_win?(token)

    return true if diagonal_down_win?(token)

    return true if diagonal_up_win?(token)

    false # No winning move found
  end

  private

  def diagonal_up_win?(token)
    (3..5).each do |row|
      (0..3).each do |col|
        return true if (0..3).all? { |i| @grid[row - i][col + i] == token }
      end
    end

    false
  end

  def diagonal_down_win?(token)
    (0..2).each do |row|
      (0..3).each do |col|
        return true if (0..3).all? { |i| @grid[row + i][col + i] == token }
      end
    end

    false
  end

  def vertical_win?(token)
    (0..6).each do |col|
      (0..2).each do |row|
        return true if (0..3).all? { |i| @grid[row + i][col] == token }
      end
    end

    false
  end

  def horizontal_win?(token)
    @grid.each do |row|
      (0..3).each do |col|
        return true if row[col..col + 3].all? { |t| t == token }
      end
    end

    false
  end

  def next_available_row(column)
    (0..5).reverse_each do |row|
      return row if @grid[row][column] == empty_token
    end
    nil
  end
end
