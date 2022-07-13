require './lib/board'
require './lib/cell'

RSpec.describe Board do
  before :each do
    @board = Board.new
  end
  it 'exists' do 
    expect(@board).to be_a(Board)
  end


  it 'creates cells hash' do
    expect(@board.cells.class).to eq(Hash)
    expect(@board.cells.count).to eq(16)
    expect(@board.cells["A1"]).to be_a(Cell) ## we can change this later to test everything is a cell
  end
end