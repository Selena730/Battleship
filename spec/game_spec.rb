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
      expect{@game.welcome_message}.to output("Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.\n").to_stdout
    end
  end

  describe '#generate_random_coordinate' do
    it 'returns a valid random coordinate' do
      coordinate = @game.generate_random_coordinate
      
      expect(coordinate).to match("[A-D][1-4]")
    end
  end

    describe '#generate_random_coordinates' do
        it 'returns an array of valid random coordinates' do
            cruiser = Ship.new("Cruiser", 3)
            cruiser_coordinates = @game.generate_random_coordinates(cruiser)
            submarine = Ship.new("Submarine", 2)
            submarine_coordinates = @game.generate_random_coordinates(submarine)

            coordinates = cruiser_coordinates + submarine_coordinates
            
            expect(submarine).to be_a(Ship)
            expect(cruiser).to be_a(Ship)
            expect(cruiser_coordinates.size).to eq(3)
            expect(submarine_coordinates.size).to eq(2)
            expect(coordinates).to be_an(Array)
        
            coordinates.each do |coordinate|
                expect(coordinate).to match("[A-D][1-4]")
            end
        end
    end
end