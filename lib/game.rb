require './lib/board'
require './lib/ship'
class Game

  def initialize
    @player_board = Board.new
    @computer_board = Board.new
    @player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    @computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]

    welcome_messageq
  end

  def welcome_message
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    handle_menu_input
    # self.handle_init_input <--- example

    # make method called - handle initial input
      #  this method would be similar but different to a method called handle_game_input which will keep running
      #  once the game starts and handles whatever input the user uses -- Look for more pseudo code

    # here we call handle_init_input
      # if user input is P -> start game
      # else if user input is Q -> Game.quit()
      # else -> tell user input is invalid and mention possible inputs.

      # ^ the above can be solved in 1 of 2 ways
      #  while user_input !== 'P' or 'Q'
       # message the user with the error message
       #end
      # then a simple if/else because we could have either 'P' or 'Q' as input
  end


  ## Handles Game Input as long as the game - started - and has not finished
    #  Board.display() => display board before start of turn for human
    #   while game !== 'over'
    #   check who's turn it is
    # if player -> get input => then call board.valid_coordinates or place etc. ==> I don;t know the exact methods you have
      # continued ... ya3ni check if user provided valid inputs => valid coordinates -> valid move -> save that info in
      # board and return something to confirm or maybe return the updated board
    # else if computer => same thing but with no user input
  ##
  def handle_menu_input
    loop do
      input = gets.chomp.downcase
      case input
      when 'p'
        start_game
        break
      when 'q'
        puts "Goodbye!"
        break
      else
        puts "Invalid input. Enter 'p' to play or 'q' to quit."
      end
    end
  end

  def start_game
    # initialise board
    # initialise players
    # get player battleship locations
    # next turn if game is not over
  end


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


  def setup_player_board
    puts "You need to lay out your ships on the board."
    @player_ships.each do |ship|
      puts @player_board.render(true)
      puts "Enter the squares for the #{ship.name} (#{ship.length} spaces), like 'A1 A2 A3':"

      loop do
        coordinates = gets.chomp.upcase.split
        if @player_board.valid_placement?(ship, coordinates)
          @player_board.place(ship, coordinates)
          break
        else
          puts "Those are invalid coordinates. Please try again:"
        end
      end
    end
  end

end


Game.new
