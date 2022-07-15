class Board
  attr_reader :cells
  def initialize
    @cells = {}
  end

  def cells
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each { |coordinate| @cells[coordinate] = Cell.new(coordinate) }
    @cells
  end

  def valid_coordinate?(coordinate)
    return true if cells.keys.include? coordinate
    false
  end

  def valid_placement?(ship, coordinate)
    x_coord = coordinate.map { |coord| coord[1]}
    y_coord = coordinate.map { |coord| coord[0]}
    return false if ship.length != coordinate.length
    if y_coord.uniq.length == coordinate.length && x_coord.uniq.length == coordinate.length
      false
    elsif ((y_coord.minmax[0])..(y_coord.minmax[1])).to_a.length > ship.length || ((x_coord.minmax[0])..(x_coord.minmax[1])).to_a.length > ship.length == true
      false
    elsif (x_coord[-1].ord < x_coord[-2].ord || x_coord[0].ord > x_coord[1].ord) || (y_coord[-1].ord < y_coord[-2].ord || y_coord[0].ord > y_coord[1].ord) == true
      false
    else
      true
    end
  end

  def place(ship, coordinate)
    ship_coordinates = []
    coordinate.map do |coord|
      require 'pry'; binding.pry
      ship_coordinates << @cells[coord]
    end
    ship_coordinates.map { |coord| coord.place_ship(ship) }
  end
end