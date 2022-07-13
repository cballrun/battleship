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
    expect(@board.cells).to all()
  end
end