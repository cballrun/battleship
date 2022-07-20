require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/game'
require './lib/computer'

RSpec.describe Computer do
  before :each do
    @computer = Computer.new
  end

  it 'exists' do
    expect(@computer).to be_a(Computer)
  end

  it 'insantiates an instance of board' do
    expect(@computer.cpu_board).to be_a(Board)
  end

  it 'has a ships attribute' do
    expect(@computer.ships.length).to eq(2)
  end

  it 'has a cruiser and a submarine' do
    expect(@computer.ships[0].name).to eq("Cruiser")
    expect(@computer.ships[1].name).to eq("Submarine")
  end
 
 

end