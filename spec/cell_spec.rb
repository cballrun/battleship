require './lib/ship'
require './lib/cell'

RSpec.describe Cell do
  before :each do 
    @cell = Cell.new("B4")
    # @cruiser = Ship.new("Cruiser", 3)
  end
  it 'exists' do 
    expect(@cell).to be_a(Cell)
  end
  it 'has coordinates' do 
    expect(@cell.coordinate).to eq("B4")
  end
  it 'had ship' do
    expect(@cell.ship).to eq(nil)
  end
  it 'has empty?' do
    expect(@cell.empty?).to eq(true)
  end
  # xit 'creates and places ship' do
  #   expect(@cell.place_ship(@cruiser)).to be_a(Ship)
  #   expect(@cell.ship).to eq(@cruiser)
  #   expect(@cell.empty?).to eq(false)
  # end
end