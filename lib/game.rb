require './lib/board'
require './lib/ship'
class Game

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_shots = []
  end

  def play
    welcome_message
  end


  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    handle_menu_input
  end


  def handle_menu_input(input = nil)
    input ||= gets.chomp.downcase
    case input
    when 'p'
      start_game
    when 'q'
      puts "Goodbye!"
    else
      puts "Invalid input. Enter 'p' to play or 'q' to quit."
    end
  end

  def start_game
    setup_computer_board
    setup_player_board
    play_game
  endB4
  

  def setup_computer_board
    @computer_ships.each do |ship|
      place_ship_randomly(ship, @computer_board)
    end
  end


  def place_ship_randomly(ship, board)
    valid_placement = false
    until valid_placement
      coordinates = generate_random_coordinates(ship)
      if board.valid_placement?(ship, coordinates)
        board.place(ship, coordinates)
        valid_placement = true
      end
    end
  end

  def generate_random_coordinates(ship)
    orientation = ['horizontal', 'vertical'].sample
    rows = ('A'..'D').to_a
    cols = (1..4).to_a

    if orientation == 'horizontal'
      row = rows.sample
      max_start_col = 5 - ship.length
      start_col = rand(1..max_start_col)
      (start_col...(start_col + ship.length)).map { |col| "#{row}#{col}" }
    else
      col = cols.sample
      max_start_row = 'D'.ord - ship.length + 1
      start_row = rand('A'.ord..max_start_row).chr
      (start_row.ord...(start_row.ord + ship.length)).map { |row| "#{row.chr}#{col}" }
    end
  end

  def generate_unique_random_coordinate
    loop do
      coordinate = generate_random_coordinate
      unless @computer_shots.include?(coordinate)
        @computer_shots << coordinate
        return coordinate
      end
    end
  end


  def setup_player_board
    puts "You need to lay out your ships on the board."
    @player_ships.each do |ship|
      place_player_ship(ship)
    end
  end

  def place_player_ship(ship)
    loop do
      puts @player_board.render(true)
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces), or type 'exit' to quit:"
      input = gets.chomp.upcase
      exit_game if input == "EXIT"  # Ensure this is correctly matching the case
      coordinates = input.split
      if @player_board.valid_placement?(ship, coordinates)
        @player_board.place(ship, coordinates)
        break
      else
        puts "Those are invalid coordinates. Please try again:"
      end
    end
  end

  def play_game
    until game_over?
      display_boards
      player_turn
      break if game_over?
      computer_turn
    end
    announce_winner
    # Do not recursively call play here; just end this method
  end


  def game_over?
    player_ships_sunk = @player_ships.all?(&:sunk?)
    computer_ships_sunk = @computer_ships.all?(&:sunk?)
    player_ships_sunk || computer_ships_sunk
  end


  def display_boards
    puts "=============COMPUTER BOARD============="
    puts @computer_board.render(false)
    puts "==============PLAYER BOARD=============="
    puts @player_board.render(true)
  end


  def player_turn
    loop do
      puts "Enter the coordinate for your shot:"
      coordinate = gets.chomp.upcase
      if @computer_board.valid_coordinate?(coordinate) && !@computer_board.cells[coordinate].fired_upon?
        result = @computer_board.cells[coordinate].fire_upon
        puts result ? "Hit at #{coordinate}!" : "Miss at #{coordinate}."
        break
      else
        puts "Invalid coordinate or already fired upon. Please try again."
      end
    end
  end


  def computer_turn
    coordinate = generate_unique_random_coordinate
    result = @player_board.cells[coordinate].fire_upon
    puts result ? "Computer hit at #{coordinate}!" : "Computer miss at #{coordinate}."
  end


  def generate_random_coordinate
    rows = ('A'..'D').to_a
    cols = (1..4).to_a
    "#{rows.sample}#{cols.sample}"
  end


  def announce_winner
    if @player_ships.all?(&:sunk?)
      puts "Sorry, you lost. The computer won."
    else
      puts "Congratulations, you won!"
    end
  end
end

# def exit_game
#   puts "Exiting game. Thank you for playing!"
#   exit
# end

# if __FILE__ == $PROGRAM_NAME
#   game = Game.new
#   game.play
# end
