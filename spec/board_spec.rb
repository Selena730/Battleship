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
end



