class Board
  attr_reader :cells
  def initialize
    @cells = {}
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each { |coordinate| @cells[coordinate] = Cell.new(coordinate) }
  end

  def valid_coordinate?(coordinate)
    return true if cells.keys.include? coordinate
    false
  end

  def valid_placement?(ship, coordinates)
    # Return false if any of the coordinates are not empty
    return false if coordinates.any? { |coordinate| !@cells[coord].empty? }
    return false unless ship.length == coordinates.length
    # [A1, A2, A3] [A1, B1] [A1, B1, C1]
    # For each of the coordinates x# y*
    #      x = y (the row is the same) and # = * +1 (sequential column)
          # = * (the column is the same) and x = y +1 (sequential row)
    # row_is_same?(coordinates) coordinates.all? { |coordinate| coordinate[0] == coordinates[0][0] }
    # column_is_same?(coordinates) coordinates.all? { |coordinate| coordinate[1] == coordinates[0][1] }
    # column_is_sequential?(coordinates) coordinates.each_cons(2) { |coordinate, coordinate1| coordinate[1] == coordinate1[1] +1 }
    # row_is_sequential?(coordinates)
    if row_is_same? && column_is_sequential?
      true
    elsif column_is_same? && row_is_sequential?
      true
    end

    x_coordinate = coordinates.map { |coordinate| coord[1] }
    y_coordinate = coordinates.map { |coordinate| coord[0] }
    if y_coordinate.uniq.length == coordinates.length && x_coordinate.uniq.length == coordinates.length
      false
    elsif ((y_coordinate.minmax[0])..(y_coordinate.minmax[1])).to_a.length > ship.length || ((x_coordinate.minmax[0])..(x_coordinate.minmax[1])).to_a.length > ship.length == true
      false
    elsif (x_coordinate[-1].ord < x_coordinate[-2].ord || x_coordinate[0].ord > x_coordinate[1].ord) || (y_coordinate[-1].ord < y_coordinate[-2].ord || y_coordinate[0].ord > y_coordinate[1].ord) == true
      false
    else
      true
    end
  end

  def place(ship, coordinate)
    coordinate.each { |coord| @cells[coord].place_ship(ship) }
  end
end