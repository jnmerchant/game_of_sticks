require_relative 'game_of_sticks'

def main
  display_greeting
  number_of_sticks = get_number_of_sticks
  number_of_players = get_number_of_players
  game = Game.new(number_of_players, number_of_sticks)
  #puts game
end

def display_greeting
  puts "Welcome to the Game of Sticks!"
  puts "How many sticks are there on the table initially (10-100)? "
end

def display_player_prompt
  puts "Please specify the number of player by entering 1 or 2."
end

def get_number_of_sticks
  sticks_input = gets.chomp.to_i
  validate_input(sticks_input)
end

def get_number_of_players
  display_player_prompt
  player_input = gets.chomp.to_i
  validate_input(player_input)
end

def validate_input(input)
  calling_method = caller_locations(1,1)[0].label
  valid = false
  until valid
    if calling_method == 'get_number_of_sticks'  && !input.between?(10,100)
      puts "Please enter a number of sticks between 10 and 100: "
      get_number_of_sticks
    end
    if calling_method == 'get_number_of_players' && !input.between?(1,2)
      get_number_of_players
    end
    valid = true
  end
  input
end

if __FILE__ == $PROGRAM_NAME
  main
end
