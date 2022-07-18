class Cell
  attr_reader :coordinate,
              :ship,
              :taken_fire

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

  def render(display = false)
    if empty? == true && fired_upon? == true
      "M"
    elsif display == true && empty? == false
      "S"
    elsif empty? == false && ship.sunk? == true
      "X"
    elsif empty? == false && fired_upon? == true
      "H"
    else
      "."
    end
  end
end

