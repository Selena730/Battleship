class Cell
  attr_reader :coordinate
  attr_accessor :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fire_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end


  def fire_upon
    if @ship
      @ship.hit
    end
    @fire_upon = true
  end


  def fired_upon?
    @fire_upon
  end


  def render(reveal_ship = false) #come back and fix nesting
    if fired_upon?
      if ship
        return ship.sunk? ? "X" : "H"
      else
        return "M"
      end
    else
      if reveal_ship && ship
        return "S"
      else
        return "."
      end
    end
  end
end
