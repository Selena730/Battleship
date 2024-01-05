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

  def valid_coordinate?(coordinate)
    @cells.key?(coordinate)
  end

  def place(ship, coordinates)
    return if !valid_placement?(ship, coordinates)
  
    coordinates.each do |coord|
      cell = @cells[coord]
      cell.place(ship)
    end
  end

  def render_board
end
