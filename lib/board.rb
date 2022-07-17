class Board
  attr_reader :cells
  def initialize
    @cells = {}
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each { |coordinate| @cells[coordinate] = Cell.new(coordinate) }
  end

  def valid_coordinate?(coordinate)
    @cells.keys.include? coordinate
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.any? { |coordinate| !@cells[coordinate].empty? }
    return false unless ship.length == coordinates.length
    x_coordinate = coordinates.map { |coordinate| coordinate[1] }
    y_coordinate = coordinates.map { |coordinate| coordinate[0] }
    return false if y_coordinate.uniq.length == coordinates.length && x_coordinate.uniq.length == coordinates.length
    if row_is_same?(coordinates) && column_is_sequential?(coordinates)
      true
    elsif column_is_same?(coordinates) && row_is_sequential?(coordinates)
      true
    else
      false
    end
  end

  def place(ship, coordinate)
    coordinate.each { |coord| @cells[coord].place_ship(ship) }
  end

  def row_is_same?(coordinates)
    coordinates.all? { |coordinate| coordinate[0] == coordinates[0][0] }
  end

  def column_is_same?(coordinates)
    coordinates.all? { |coordinate| coordinate[1] == coordinates[0][1]}
  end

  def row_is_sequential?(coordinates)
    coordinate_rows = coordinates.map { |coordinate| coordinate[0] }
    coordinate_rows.each_cons(2).map do |row1, row2|
      row1.next == row2
    end.all?
  end

  def column_is_sequential?(coordinates) #returns true or false
    coordinate_columns = coordinates.map { |coordinate| coordinate[1] }
    coordinate_columns.each_cons(2).map do |column1, column2|
      column1.next == column2
    end.all?
  end
end