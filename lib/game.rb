require './lib/board'
require './lib/ship'
require './lib/cell'
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
    choice = gets.chomp.downcase

    if choice == 'p'
      start_playing

    elsif choise == 'q'
      puts "Goodbye!"
      continue = false

    else
      puts "Invalid option, enter p to play. Enter q to quit."
    end
  end

  def start_playing
    
    puts "game in session"
    
  end

  def ship_coordinates
    while true
      puts 'Enter coloumn letter (between A and D):'
      placement_coloumn = gets.chomp.to_s.upcase
      break if placement_coloumn.between?(0, 4)
    end
    
    while true
      puts 'Enter row number (between 1 and 4):'
      placement_row = gets.chomp.to_i-1
      break if placement_row.between?(0, 4)
    end

    if valid_placement?(ship, coordinate) == false
      puts "Unable to place. Please try again."
    end
  end
end

