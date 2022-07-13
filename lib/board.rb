class Board
  def initialize

  end
  def cells
    grid = {}
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each {|coordinate| grid[coordinate] = Cell.new(coordinate)}
    grid
    
    # grid["A1"] = Cell.new("A1")
    # grid["A2"] = Cell.new("A2")
    # grid["A3"] = Cell.new("A3")
    # grid["A4"] = Cell.new("A4")
    # grid["B1"] = Cell.new("B1")
    # grid["B2"] = Cell.new("B2")
    # grid["B3"] = Cell.new("B3")
    # grid["B4"] = Cell.new("B4")
    # grid["C1"] = Cell.new("C1")
    # grid["C2"] = Cell.new("C2")
    # grid["C3"] = Cell.new("C3")
    # grid["C4"] = Cell.new("C4")
    # grid["D1"] = Cell.new("D1")
    # grid["D2"] = Cell.new("D2")
    # grid["D3"] = Cell.new("D3")
    # grid["D4"] = Cell.new("D4")
      
  end
end