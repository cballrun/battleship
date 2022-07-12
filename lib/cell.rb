class Cell  
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship
  end
  def empty?
    return true if @ship == nil
    false
  end
  def place_ship(ship_object)
    @ship << ship_object
  end
end