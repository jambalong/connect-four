# frozen_string_literal: true

require_relative 'token'

# A grid with 6 rows and 7 columns
class Board
  include Token

  def initialize
    @grid = Array.new(6) { Array.new(7) { empty_token } }
  end
end
