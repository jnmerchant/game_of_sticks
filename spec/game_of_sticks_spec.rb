require 'game_of_sticks'

describe "Game.new" do
  it "creates a new game object" do
    game = Game.new(2, 50)
    expect(game.number_of_players).to be 2
    expect(game.number_of_sticks).to be 50
  end

describe "#get_remaining_sticks" do
  context "#return the number of sticks remaining after a players turn" do
    it "#reduces the re" do
      game = Game.new(2, 50)
      expect(game.get_remaining_sticks(3)).to be 47
    end
  end
end

end
