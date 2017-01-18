class Game
  def initialize(number_of_players, number_of_sticks)
    @number_of_players = number_of_players
    @number_of_sticks = number_of_sticks
    @number_sticks_remaining = number_of_sticks
  end

  attr_reader :number_of_players
  attr_reader :number_of_sticks
  attr_accessor :number_sticks_remaining

  def get_remaining_sticks(sticks_in_turn)
    @number_sticks_remaining -= sticks_in_turn
  end

end
