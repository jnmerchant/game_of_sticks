class Game
  def initialize(number_of_players, number_of_sticks)
    @number_of_players = number_of_players
    @number_of_sticks = number_of_sticks
    @number_sticks_remaining = number_of_sticks
    @player_turn = ''
  end

  attr_reader :number_of_players
  attr_reader :number_of_sticks
  attr_accessor :number_sticks_remaining
  attr_accessor :player_turn

  def get_remaining_sticks(sticks_in_turn)
    @number_sticks_remaining -= sticks_in_turn
  end

  def next_players_turn
    players = ["Player1", "Player2"]
    if @player_turn == '' && @number_of_players == 2
      @player_turn = players.sample
    else
      @player_turn == players[0] ? @player_turn = players[1] : @player_turn = players[0]
    end
  end

  def take_turn(sticks_taken)
    @number_sticks_remaining = get_remaining_sticks(sticks_taken)
    @player_turn = next_players_turn
  end

  def to_s
    "Player: #{@number_of_players}, Starting Sticks: #{@number_of_sticks}, Remaining Sitcks: #{@number_sticks_remaining}"
  end

end
