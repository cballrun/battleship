class Player
  attr_reader :board,
              :ships
  def initialize
    @board = Board.new
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def player_cruiser_placement(coordinate1, coordinate2, coordinate3)
    cruiser = Ship.new("Cruiser", 3)
    add_ship(cruiser)
    player_input = [coordinate1, coordinate2, coordinate3]
    if @board.valid_placement?(cruiser, player_input) == false
      return false
    else
      @board.place(cruiser, player_input)
    end
  end

  def player_submarine_placement(coordinate1, coordinate2)
    submarine = Ship.new("Submarine", 2)
    add_ship(submarine)
    player_input = [coordinate1, coordinate2]
    if @board.valid_placement?(submarine, player_input) == false
      return false
    else
      @board.place(submarine, player_input)
    end
  end

  def player_fire_control(coordinate)


  end
end