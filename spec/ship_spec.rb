require './lib/ship'

RSpec.describe Ship do
  before :each do
    @cruiser = Ship.new("Cruiser", 3)
  end
  it 'exists' do
    expect(@cruiser).to be_a(Ship)
  end
  it 'has the correct attributes' do
    expect(@cruiser.name).to eq("Cruiser")
    expect(@cruiser.length).to eq(3)
    expect(@cruiser.health).to eq(3)
  end
  it 'Ship #sunk?' do
    expect(@cruiser.sunk?).to eq(false)
    @cruiser.length.times do
      @cruiser.hit
    end
    expect(@cruiser.sunk?).to eq(true)
  end
  it 'can take a hit' do
    @cruiser.hit
    expect(@cruiser.health).to eq(2)
  end













end