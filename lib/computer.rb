class Computer
  attr_reader :cpu_board,
              :ships
  def initialize
    @cpu_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
    @ships = [@cruiser, @submarine]
  end

  def cruiser_coord_generator
    cpu_cruiser_coords = []
    x = ["1", "2", "3", "4"]
    y = ["A", "B", "C", "D"]
    coord1 = y.sample + x.sample
    cpu_cruiser_coords << coord1
    coord2 = y.sample + x.sample
    cpu_cruiser_coords << coord2
    coord3 = y.sample + x.sample
    cpu_cruiser_coords << coord3
    cpu_cruiser_coords

    if @cpu_board.valid_placement?(@cruiser, cpu_cruiser_coords) == true
      @cpu_board.place(@cruiser, cpu_cruiser_coords)
    else
      cruiser_coord_generator
    end
  end

  def sub_coord_generator
    cpu_sub_coords = []
    x = ["1", "2", "3", "4"]
    y = ["A", "B", "C", "D"]
    coord1 = y.sample + x.sample
    cpu_sub_coords << coord1
    coord2 = y.sample + x.sample
    cpu_sub_coords << coord2
    cpu_sub_coords

    if @cpu_board.valid_placement?(@submarine, cpu_sub_coords) == true
      @cpu_board.place(@submarine, cpu_sub_coords)
    else
      sub_coord_generator
    end
  end

  def defeat?
    @ships.all? { |ship| ship.sunk? == true }
  end
end