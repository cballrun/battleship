require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do 
    @cell = Cell.new("C4")
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end
  it 'exists' do 
    expect(@cell).to be_a(Cell)
  end
  it 'has coordinates' do 
    expect(@cell.coordinate).to eq("C4")
  end
  it 'had ship' do
    expect(@cell.ship).to eq(nil)
  end
  it 'has empty?' do
    expect(@cell.empty?).to eq(true)
  end
  it 'creates and places ship' do
    expect(@cell.place_ship(@cruiser)).to be_a(Ship)
    expect(@cell.ship).to eq(@cruiser)
    expect(@cell.empty?).to eq(false)
  end
  it 'does fired_upon?' do 
    expect(@cell.fired_upon?).to eq(false)
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.fired_upon?).to eq(true)
  end
  it 'reduces ship health on hit' do 
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(2)
    @cell.fire_upon
    expect(@cell.ship.health).to eq(1)
    @cell.fire_upon
    expect(@cell.ship.sunk?).to eq(true)
  end
  it 'fire upon works without ship present' do
    @cell = Cell.new("B4")
    @cell.fire_upon
    expect(@cell.fired_upon?).to eq(true)
  end
  it 'does cell render method' do
    expect(@cell_1.render).to eq(".")
    @cell_1.fire_upon
    expect(@cell_1.render).to eq("M")
    @cell_2.place_ship(@cruiser)
    expect(@cell_2.render).to eq(".")
    expect(@cell_2.render(true)).to eq("S")
    @cell_2.fire_upon
    expect(@cell_2.render).to eq("H")
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.hit 
    @cruiser.hit
    expect(@cruiser.sunk?).to eq(true)
    expect(@cell_2.render).to eq("X")
  end
end