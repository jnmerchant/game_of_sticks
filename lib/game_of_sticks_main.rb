require_relative 'game_of_sticks'

def main
  display_greeting
  get_number_of_sticks
  get_number_of_players

end

def display_greeting
  puts "Welcome to the Game of Sticks!"
  puts "How many sticks are there on the table initially (10-100)? "
end

def get_number_of_sticks
  gets.chomp.to_i
  validate_input
end

def get_number_of_players
  puts "Please enter 1 or 2 for the number of players:"
  gets.chomp.to_i
  validate_input
end

def validate_input
  calling_method = puts caller_locations(1,1)[0].label
  if calling_method = 'get_number_of_sticks'  &&
    puts "Please enter a number between 10 and 100: "
  end
  if calling_method = 'get_number_of_players' &&
    puts "Please specify the number of player by entering 1 or 2."
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end
