require './lib/board'
require './lib/cell'

RSpec.describe Board do
    before(:each) do
        @board = Board.new
    end

    it "exists" do
        board = Board.new

        expect(board).to be_instance_of(Board)
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

end
