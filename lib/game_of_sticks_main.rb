require_relative 'game_of_sticks'

def main
  display_greeting
  number_of_sticks = get_number_of_sticks
  number_of_players = get_number_of_players
  game = Game.new(number_of_players, number_of_sticks)
  while game.number_sticks_remaining > 0
   player_takes_turn(game)
   puts game
  end
end

def display_greeting
  puts "Welcome to the Game of Sticks!"
  puts "How many sticks are there on the table initially (10-100)? "
end

def display_player_prompt
  puts "Please specify the number of player by entering 1 or 2."
end

def get_number_of_sticks
  sticks_input = gets.chomp
  validate_input(sticks_input)
end

def get_number_of_players
  display_player_prompt
  player_input = gets.chomp
  validate_input(player_input)
end

def get_sticks_taken
  sticks_input = gets.chomp
  validate_input(sticks_input)
end

def validate_input(user_input)
  calling_method = caller_locations(1,1)[0].label
  input = user_input.to_i
  valid = false

  until valid
    if calling_method == 'get_number_of_sticks'  && !input.between?(10,100)  && input != 0
      puts "Please enter a number of sticks between 10 and 100: "
      get_number_of_sticks
    end
    if calling_method == 'get_number_of_players' && !input.between?(1,2) && input != 0
      get_number_of_players
    end
    if calling_method == 'get_sticks_taken' && !input.between?(1,3) && input != 0
      puts "Please enter a number of sticks between 1 and 3. "
      get_sticks_taken
    end
    valid = true
  end
  input
end

def player_takes_turn(game)
  if game.next_players_turn == ''
    game.next_players_turn
  end
  puts game.next_players_turn
  puts "There are #{game.number_sticks_remaining} on the table."
  puts " #{game.player_turn} how many sticks do you take (1,2,3)? "
  game.take_turn(get_sticks_taken)
end

if __FILE__ == $PROGRAM_NAME
  main
end
