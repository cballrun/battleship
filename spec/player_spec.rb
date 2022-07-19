require './lib/ship'
require './lib/board'
require './lib/cell'
require './lib/player'
require './lib/game'

RSpec.describe Player do
  before :each do
    @player = Player.new
  end

  it 'exists' do
    expect(@player).to be_a(Player)
  end

  it 'insantiates an instance of board' do
    expect(@player.board).to be_a(Board)
  end

  it 'has a ships attribute' do
    expect(@player.ships).to eq([])
  end

  it 'it does player_cruiser_placement' do
    @player.player_cruiser_placement("A1", "A2", "A3")
    expect(@player.ships.count).to eq(1)
    @player.player_submarine_placement("B1", "B2")
    expect(@player.ships.count).to eq(2)
    expect(@player.player_cruiser_placement("A1", "A2", "A4")).to eq(false)
    expect(@player.player_submarine_placement("B2", "B4")).to eq(false)
  end
end