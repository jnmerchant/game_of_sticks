require 'game_of_sticks'

describe "Game.new" do
  it "creates a new game object" do
    game = Game.new(2, 50)
    expect(game.number_of_players).to be 2
    expect(game.number_of_sticks).to be 50
  end

describe "#get_remaining_sticks" do
  context "#return the number of sticks remaining after a players turn" do
    it "#reduces the remaining sticks by the amount taken" do
      game = Game.new(2, 50)
      expect(game.get_remaining_sticks(3)).to be 47
    end
  end
end

describe "#next_players_turn" do
  context "#determine next_players_turn should be set to Player1 when its current value is Player2" do
    it "#determines next_players_turn when player_turn == Player1" do
      game = Game.new(2, 50)
      game.player_turn = 'Player1'
      expect(game.next_players_turn).to eq 'Player2'
    end

    it "#determines next_players_turn when player_turn == Player2" do
      game = Game.new(2, 50)
      game.player_turn = 'Player2'
      expect(game.next_players_turn).to eq 'Player1'
    end

    it "#determines next_players_turn when player_turn == ''" do
      game = Game.new(2, 50)
      game.player_turn = ''
      expect(game.next_players_turn).to eq('Player1').or eq('Player2')
    end
  end
end

describe "#take_turn" do
  context "#player takes a turn" do
    it "#processes a players turn in the game" do
      game = Game.new(2, 50)
      game.player_turn = ''
      game.take_turn(3)
      expect(game.number_sticks_remaining).to eq 47
      expect(game.next_players_turn).to eq('Player1').or eq('Player2')
    end
  end
end

end
