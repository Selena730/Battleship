require './lib/cell'
class Board
  attr_reader :cells

  def initialize
    @cells = {}
    create_cells
  end

  def create_cells

    rows = ('A'..'D').to_a
    cols = (1..4).to_a

    rows.each do |row|
      cols.each do |col|

        cell_key = "#{row}#{col}"
        @cells[cell_key] = Cell.new(cell_key)
      end
    end
  end
end
