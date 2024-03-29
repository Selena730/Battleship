require './spec/spec_helper'
require './lib/board'
require './lib/ship'
require './lib/cell'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
        @cruiser = Ship.new("Cruiser", 3)
        @submarine = Ship.new("Submarine", 2)
    end

    it "exists" do
        board = Board.new
        expect(@board = Board.new).to be_instance_of(Board)
    end

    describe '#cells' do
        it 'is a hash' do
            expect(@board.cells).to be_a(Hash)
        end
    end

    describe '#create_cells' do
        it 'contains 16 key/value pairs' do
            expect(@board.cells.size).to eq(16)
        end
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

        it "can identify invalid amount of cells holding length of ship corretly" do


            expect(@board.valid_placement?(@cruiser, ["A1", "A2"])).to be(false)
            expect(@board.valid_placement?(@submarine, ["A2", "A3", "A4"])).to be(false)
        end
    end

    describe '#valid_placement? consecutive' do
        it "can identify invalid order of consecutive cells" do
            expect(@board.valid_placement?(@cruiser, ["A1", "A2", "A4"])).to be(false)
            expect(@board.valid_placement?(@submarine, ["A1", "C1"])).to be(false)
            expect(@board.valid_placement?(@cruiser, ["A3", "A2", "A1"])).to be(false)
            expect(@board.valid_placement?(@submarine, ["C1", "B1"])).to be(false)
        end

        it "can register invalid placement (diagonal)" do
            expect(@board.valid_placement?(@cruiser, ["A1", "B2", "C3"])).to be(false)
            expect(@board.valid_placement?(@submarine, ["C2", "D3"])).to be(false)
        end

        it "can identify valid ship placements" do
            expect(@board.valid_placement?(@submarine, ["A1", "A2"])).to be(true)
            expect(@board.valid_placement?(@cruiser, ["B1", "C1", "D1"])).to be(true)
        end
  end

    describe '#place_ship' do

        it "allows user to place ship" do

            @board.place(@cruiser, ["A1", "A2", "A3"])
            cell_1 = @board.cells["A1"]
            cell_2 = @board.cells["A2"]
            cell_3 = @board.cells["A3"]

            expect(cell_1.ship).to eq(@cruiser)
            expect(cell_2.ship).to eq(@cruiser)
            expect(cell_3.ship).to eq(@cruiser)
            expect(cell_3.ship == cell_2.ship).to be(true)
        end

        it "doesn't allow overlapping ships" do
            submarine = Ship.new("Submarine", 2)

            @board.place(@cruiser, ["A1", "A2", "A3"])
            expect(@board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
        end
    end

    describe '#rendering_board' do

        it "allows user to place ship onto the board" do

            @board.place(@cruiser, ["A1", "A2", "A3"])
            cell_1 = @board.cells["A1"]
            cell_2 = @board.cells["A2"]
            cell_3 = @board.cells["A3"]

            expect(cell_1.ship).to eq(@cruiser)
            expect(cell_2.ship).to eq(@cruiser)
            expect(cell_3.ship).to eq(@cruiser)
            expect(cell_3.ship == cell_2.ship).to be(true)
        end

        it "doesn't allow overlapping ships" do
            submarine = Ship.new("Submarine", 2)

            @board.place(@cruiser, ["A1", "A2", "A3"])
            expect(@board.valid_placement?(submarine, ["A1", "B1"])).to be(false)
        end
  end

    describe '#cells' do
        it 'is a hash' do
            expect(@board.cells).to be_a(Hash)
        end
    end

    describe '#create_cells' do
        it 'contains 16 key/value pairs' do
            expect(@board.cells.size).to eq(16)
        end
    end

    describe '#render_board' do
    it "can render board properly" do
      cruiser = Ship.new("Cruiser", 3)

      @board.place(cruiser, ["A1", "A2", "A3"])
      expect(@board.render).to eq("  1 2 3 4\n" +
                                  "A . . . .\n" +
                                  "B . . . .\n" +
                                  "C . . . .\n" +
                                  "D . . . .\n")
      expect(@board.render(true)).to eq("  1 2 3 4\n" +
                                        "A S S S .\n" +
                                        "B . . . .\n" +
                                        "C . . . .\n" +
                                        "D . . . .\n")
    end
  end
end
