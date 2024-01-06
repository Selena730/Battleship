require './lib/board'
require './lib/ship'
class Game

def initialize
  @player_board = Board.new
  @computer_board = Board.new
  @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
  @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
end

def welcome_message
  puts "Welcome to BATTLESHIP"
  puts "Enter p to play. Enter q to quit."
end

def start_game
  continue = true
  until continue == false
    welcome_message
    choice = gets.chhomp.downcase

    if choice == 'p'
      start_playing

    elsif choise == 'q'
      puts "Goodbye!"
      continue = false

    else
      puts "Invalid option, enter p to play. Enter q to quit."
    end
  end
end

