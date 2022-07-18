require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/player'

RSpec.describe Player do
  before :each do
    @board = Board.new
    @player = Player.new()
  end
end