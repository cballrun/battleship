class Board
  attr_reader :cells
  def initialize
    @cells = {}
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each { |coordinate| @cells[coordinate] = Cell.new(coordinate) }
  end

  def valid_coordinate?(coordinates)
    @cells.keys.include? coordinates
  end

  def valid_placement?(ship, coordinates)
    return false if coordinates.any? { |coordinate| valid_coordinate?(coordinate) == false }
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

  def place(ship, coordinates)
    return false if valid_placement?(ship, coordinates) == false
    coordinates.each { |coord| @cells[coord].place_ship(ship) }
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

  def render(display = false)
    "     1  2  3  4 \n" +
    "   A" + " " +  @cells["A1"].render(display) + " " + @cells["A2"].render(display) + " " + @cells["A3"].render(display) + " " + @cells["A4"].render(display) + " \n" +
    "   B" + " " +  @cells["B1"].render(display) + " " + @cells["B2"].render(display) + " " + @cells["B3"].render(display) + " " + @cells["B4"].render(display) + " \n" +
    "   C" + " " +  @cells["C1"].render(display) + " " + @cells["C2"].render(display) + " " + @cells["C3"].render(display) + " " + @cells["C4"].render(display) + " \n" +
    "   D" + " " +  @cells["D1"].render(display) + " " + @cells["D2"].render(display) + " " + @cells["D3"].render(display) + " " + @cells["D4"].render(display) + " \n"
  end
end