require_relative 'game_of_sticks'

def main
  display_greeting
  number_of_sticks = get_number_of_sticks
  number_of_players = get_number_of_players
  game = Game.new(number_of_players, number_of_sticks)
  while game.number_sticks_remaining > 0
    if game.number_sticks_remaining > 1
      player_takes_turn(game)
    elsif game.number_sticks_remaining == 1
      puts " #{game.player_turn} - there is one stick on the board...You Lose."
      play_again
    end
  end
end

def display_greeting
  puts "Welcome to the Game of Sticks!"
  puts "How many sticks are there on the table initially (10-100)? "
end

def display_player_prompt
  puts "Please specify the number of player by entering 1 or 2."
end

def display_starting_stick_prompt
  puts "Please enter a number of sticks between 10 and 100: "
end

def display_take_stick_prompt
  puts "Please enter a number of sticks taken (1,2,3) "
end

def get_number_of_sticks
  valid = false
  display_starting_stick_prompt
  starting_stick_input = gets.chomp.to_i
  until valid
    if !starting_stick_input.between?(10,100)
      display_starting_stick_prompt
      starting_stick_input = gets.chomp.to_i
    end
    valid = true
  end
  starting_stick_input
end

def get_number_of_players
  valid = false
  display_player_prompt
  player_input = gets.chomp.to_i
  until valid
    if !player_input.between?(1,2)
      display_player_prompt
      player_input = gets.chomp.to_i
    end
    valid = true
  end
  player_input
end

def get_sticks_taken
  valid = false
  sticks_input = gets.chomp.to_i
  until valid
    if !sticks_input.between?(1,3)
      display_take_stick_prompt
      sticks_input = gets.chomp.to_i
    end
    valid = true
  end
  sticks_input
end

def player_takes_turn(game)
  if game.player_turn == ''
    game.next_players_turn
  end
  puts "There are #{game.number_sticks_remaining} on the table."
  puts " #{game.player_turn}: how many sticks do you take (1,2,3)? "
  sticks_taken = get_sticks_taken
  game.take_turn(sticks_taken)
end

def play_again
  puts "Would you like to play again (y/n)?"
  play = gets.chomp
  if play == 'y'
    main
  else
    exit
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end
