class Cell
  attr_reader :coordinate,
              :ship
  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @taken_fire = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @taken_fire
  end

  def fire_upon
    @taken_fire = true
    if empty? == false
      @ship.hit
    end
  end

  def render(variable = nil)
    if empty? == true && fired_upon? == true
      p "M"
    elsif variable == true
      p "S"
    elsif empty? == false && ship.sunk? == true
      p "X"
    elsif empty? == false && fired_upon? == true
      p "H"
    else
      p "."
    end
  end
end

