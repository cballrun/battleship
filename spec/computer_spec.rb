require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/game'
require './lib/computer'

RSpec.describe Computer do
  before :each do
    @computer = Computer.new
  end

  it 'exists' do
    expect(@computer).to be_a(Computer)
  end

  it 'instantiates the board object on initialize' do
    expect(@computer.cpu_board).to be_a(Board)
  end

  it 'instantiates two ships and stores them in the ships array' do
    expect(@computer.ships[0]).to be_a(Ship)
    expect(@computer.ships[1]).to be_a(Ship)
  end

  it 'generates correct number of boarc coordinates per ship' do
    expect(@computer.cruiser_coord_generator.length).to eq(3)
    expect(@computer.sub_coord_generator.length).to eq(2)
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
end