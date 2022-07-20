require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/player'
require './lib/computer'

RSpec.describe Game do
  before :each do
    @game = Game.new
  end
  it 'exists' do
    expect(@game).to be_a(Game)
  end

  it 'instantiates computer and player classes ' do
    expect(@game.player).to be_a(Player)
    expect(@game.computer).to be_a(Computer)
  end
end