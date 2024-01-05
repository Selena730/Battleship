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
    letter = coordinate[0]
    number = coordinate[1..-1].to_i


    valid_letters = ['A', 'B', 'C', 'D']
    valid_numbers = [1, 2, 3, 4]

    valid_letters.include?(letter) && valid_numbers.include?(number)

  end

  def rows_consecutive?(rows)
    valid_rows = ('A'..'D').to_a
    (0...rows.length - 1).all? do |i|
      valid_rows.index(rows[i + 1]) - valid_rows.index(rows[i]) == 1
    end
  end

  def cols_consecutive?(cols)
    valid_columns = (1..4).to_a
    (0...cols.length - 1).all? do |i|
      valid_columns.index(cols[i + 1]) - valid_columns.index(cols[i]) == 1
    end
  end

  def valid_placement?(ship, coordinates)

    return false unless ship.length == coordinates.length

    rows = coordinates.map do |coord|
      coord[0]
    end

    cols = coordinates.map do |coord|
      coord[1..-1].to_i
    end

    rows_uniq = rows.uniq.length == 1
    cols_uniq = cols.uniq.length == 1

    rows_consecutive = rows_consecutive?(rows)
    cols_consecutive = cols_consecutive?(cols)

    (rows_uniq && cols_consecutive) || (cols_uniq && rows_consecutive)

  end

end
