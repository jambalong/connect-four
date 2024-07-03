# frozen_string_literal: true

require 'colorize'

# Contains three tokens for game
module Token
  def empty_token
    '○'.white
  end

  def red_token
    '●'.red
  end

  def blue_token
    '●'.blue
  end
end
