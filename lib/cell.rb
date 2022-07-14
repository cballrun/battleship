class Cell  
  attr_reader :coordinate,
              :ship          
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = ship  
    @taken_fire = false
  end

  def empty?
    return true if @ship == nil
    false
  end

  def place_ship(ship_object)
    @ship = ship_object
  end

  def fired_upon?
    fired_upon_logic = true
    @taken_fire && fired_upon_logic
  end

  def fire_upon
    @taken_fire = true 
    if self.empty? == false
      self.ship.hit
    end
  end
  
  def render(variable = nil)
    if self.empty? == true && self.fired_upon? == true
      p "M"
    elsif variable == true
      p "S"
    elsif self.empty? == false && self.ship.sunk? == true
      p "X"
    elsif self.empty? == false && self.fired_upon? == true
      p "H"
    else
      p "."
    end
  end
end

