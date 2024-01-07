require './lib/game'
require './lib/cell'
require './lib/ship'
require './lib/board'

RSpec.describe Game do

  before(:each) do
    @game = Game.new
  end
  
  describe '#initialize' do
    it "exists and establish boards" do
      player_board = Board.new
      computer_board = Board.new
    
    
      expect(player_board).to be_instance_of(Board)
      expect(computer_board).to be_instance_of(Board)
    end
  
    it "exists and establish ships" do
      player_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
      computer_ships = [Ship.new("Cruiser", 3), Ship.new("Submarine", 2)]
    
      
      expect(player_ships).to all(be_a(Ship))
      expect(computer_ships).to all(be_a(Ship))
    end
  end

  describe '#welcome_messages' do
    it "outputs welcome message" do
      expect{@game.welcome_message}.to output("Welcome to BATTLESHIP!\nEnter p to play. Enter q to quit.\n").to_stdout
    end
  end

  