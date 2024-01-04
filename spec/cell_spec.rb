require './lib/cell'
require './lib/ship'
require 'rspec'

RSpec.describe Cell do
  before(:each) do
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
  end

  it "exists and has attributes" do
    cell = Cell.new("B4")
    cruiser = Ship.new("Cruiser", 3)
    expect(cell).to be_instance_of(Cell)
    expect(cruiser).to be_instance_of(Ship)
    expect(cell.coordinate).to eq("B4")
    expect(cell.ship).to eq(nil)
  end

  it "can tell if cell is empty" do
    expect(@cell.empty?).to be(true)
    @cell.place_ship(@cruiser)
    expect(@cell.empty?).to be(false)
  end

  it "can be fired upon" do
    cruiser = Ship.new("Cruiser", 3)

    @cell.place_ship(cruiser)
    expect(@cell.fired_upon?).to be(false)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    expect(@cell.fired_upon?).to be(true)
  end

  it "can render a miss correctly" do
    cell_1 = Cell.new("B4")

    expect(cell_1.render).to eq(".")
    cell_1.fire_upon
    expect(cell_1.render).to eq("M")
  end

  it "can render a hit and sunk ship correctly" do
    cell_2 = Cell.new("C3")

    cell_2.place_ship(@cruiser)
    expect(cell_2.render).to eq(".")
    expect(cell_2.render(true)).to eq("S")
    cell_2.fire_upon
    expect(cell_2.render).to eq("H")
    expect(@cruiser.sunk?).to be(false)
    @cruiser.hit
    @cruiser.hit
    expect(@cruiser.sunk?).to be(true)
    expect(cell_2.render).to eq("X")
  end
end
