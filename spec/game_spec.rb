require './lib/board'
require './lib/cell'
require './lib/ship'
require './lib/game'
require './lib/player'

RSpec.describe Game do
  before :each do
    @game = Game.new
  end
  it 'exists' do
    expect(@game).to be_a(Game)
  end
end