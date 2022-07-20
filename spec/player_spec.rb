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

  it 'has a ships attribute and can add ships' do
    expect(@player.ships).to eq([])
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @player.add_ship(cruiser)
    expect(@player.ships).to eq([cruiser])
    @player.add_ship(submarine)
    expect(@player.ships).to eq([cruiser, submarine])
    expect(@player.ships.count).to eq(2)
  end

  it 'it does player_cruiser_placement' do
    @player.player_cruiser_placement("A1", "A2", "A3")
    expect(@player.ships.count).to eq(1)
    @player.player_submarine_placement("B1", "B2")
    expect(@player.ships.count).to eq(2)
    expect(@player.player_cruiser_placement("A1", "A2", "A4")).to eq(false)
    expect(@player.player_submarine_placement("B2", "B4")).to eq(false)
  end

  it 'has defeat condition' do
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    @player.add_ship(cruiser)
    @player.add_ship(submarine)
    3.times do
      @player.ships[0].hit
    end
    2.times do
      @player.ships[1].hit
    end
    expect(@player.defeat?).to eq(true)
  end
end