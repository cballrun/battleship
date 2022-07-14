class Board
  
  def initialize
  end 

  def cells
    grid = {}
    grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a
    grid_coordinates.each {|coordinate| grid[coordinate] = Cell.new(coordinate)}
    grid   
  end

  def valid_coordinate?(coordinate)
    return true if cells.keys.include? coordinate  
    false 
  end

  def valid_placement?(ship, coordinate_array)
    return false if ship.length != coordinate_array.length
      
    
    
    
      
    
      
    
  end
end

