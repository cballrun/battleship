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

  it 'receives invalid ship response from Player Class' do
  end
end