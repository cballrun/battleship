require './lib/board'
require './lib/cell'
require './lib/ship'

RSpec.describe Board do
  
  before :each do
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)   
  end

  it 'exists' do 
    expect(@board).to be_a(Board)
  end

  it 'creates cells hash' do
    expect(@board.cells.class).to eq(Hash)
    expect(@board.cells.count).to eq(16)
    expect(@board.cells["A1"]).to be_a(Cell) ## we can change this later to test everything is a cell
  end

  it 'can tell if a coordinate is valid' do
    expect(@board.valid_coordinate?("A1")).to eq(true)
    expect(@board.valid_coordinate?("D4")).to eq(true)
    expect(@board.valid_coordinate?("A5")).to eq(false)
    expect(@board.valid_coordinate?("E1")).to eq(false)
    expect(@board.valid_coordinate?("A22")).to eq(false)
  end
end