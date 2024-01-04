require './lib/board'
require './lib/ship'

Rspec.describe Board do
    before(:each) do
        @board = Board.new

        expect(@board = Board.new).to be_instance_of(Board)
    end

    it "exists and has attributes" do
        expect(@board.cells).to eq({
            "A1" => [],
            "A2" => [],
            "A3" => [],
            "A4" => [],
            "B1" => [],
            "B2" => [],
            "B3" => [],
            "B4" => [],
            "C1" => [],
            "C2" => [],
            "C3" => [],
            "C4" => [],
            "D1" => [],
            "D2" => [],
            "D3" => [],
            "D4" => []
        })
    end

  describe '#valid_coordinate?' do
   expect(@board.valid_coordinate?("A1")).to be(true)
   expect(@board.valid_coordinate?("D4")).to be(true)
   expect(@board.valid_coordinate?("A5")).to be(false)
   expect(@board.valid_coordinate?("E1")).to be(false)
   expect(@board.valid_coordinate?("A22")).to be(false)
  end 


  
  describe '#valid_placement?' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)    
  
    expect(@board.valid_placement?(cruiser, ["A1", "A2"])).to be(true)
    expect(@board.valid_placement?(submarine, ["A2", "A3", "A4"])).to be(true)
    expect(@board.valid_placement?(cruiser, ["A1", "A2", "A4"])).to be(false)
    expect(@board.valid_placement?(submarine, ["A1", "C1"])).to be(false)
    expect(@board.valid_placement?(cruiser, ["A3", "A2", "A1"])).to be(false)
    expect(@board.valid_placement?(submarine, ["C1", "B1"])).to be(false)
    expect(@board.valid_placement?(cruiser, ["A1", "B2", "C3"])).to be(false)
    expect(@board.valid_placement?(submarine, ["C2", "D3"])).to be(false)
  end
end



