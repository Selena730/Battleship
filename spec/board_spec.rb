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
   it "has valid coordinates" do

    expect(@board.valid_coordinate?("A1")).to be(true)
    expect(@board.valid_coordinate?("D4")).to be(true)
    expect(@board.valid_coordinate?("A5")).to be(false)
    expect(@board.valid_coordinate?("E1")).to be(false)
    expect(@board.valid_coordinate?("A22")).to be(false)
   end
  end 


  
  describe '#valid_placement?' do
   it "has valid ship placements" do

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
    expect(@board.valid_placement?(submarine, ["A1", "A2"])).to be(true)
    expect(@board.valid_placement?(cruiser, ["B1", "C1", "D1"])).to be(true)
   end
  end

  describe '#range' do
    before(:each) do
        @range = 3..8

        expect(@range).to be_instance_of(Range)
    end

    it "crates a range method" do
        range = 3..8
        
        expect(range.class).to be_instance_of(Range)
    end

    it "changes range from int to string" do
        range = "A".."D"

        expect(array = range.to_a).to eq([3, 4, 5, 6, 7, 8])
        expect(array.length).to eq(6)
        expect(array[3]).to eq(6)

        expect(range = "A".."D").to eq("A".."D")
        expect(range.to_a).to eq(["A", "B", "C", "D"])
    end

    it "can find original value of range" do
        range = "A".."D"

        expect("A".ord).to eq(65)
        expect("D".ord).to eq(68)
    end
  end


end



