require './lib/board'

Rspec.describe Board do

    it "exists and has attributes" do
        expect(board = Board.new).to be_instance_of(Board)
        
        expect(board.cells).to eq({
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



