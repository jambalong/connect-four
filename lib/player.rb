# frozen_string_literal: true

# Player has a name and token
class Player
  attr_reader :token
  attr_accessor :name

  def initialize(token)
    @name = nil
    @token = token
  end
end
