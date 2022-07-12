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
    @ship = ship_object
    # unexpected return of ship class value
  end
  def fired_upon?
    false
  end
  def fire_upon
    self.fired_upon? == true
    self.ship.hit
  end
end