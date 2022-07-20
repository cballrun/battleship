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

  it 'has defeat condition' do
    3.times do
      @computer.ships[0].hit
    end
    2.times do
      @computer.ships[1].hit
    end
    expect(@computer.defeat?).to eq(true)
  end

  it 'generates correct number of boarc coordinates per ship' do
    expect(@computer.cruiser_coord_generator.length).to eq(3)
    expect(@computer.sub_coord_generator.length).to eq(2)
  end
 end