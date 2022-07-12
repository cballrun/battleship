class Ship
  attr_reader :name, :length, :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = length
  end

  def sunk?
    return false if health > 0
    true
    # if @health > 0
    #   false
    # else
    #   true
    # end
  end

  def hit
    @health -= 1
  end

 #this method needs to be fixed
 #it returns 2 in the interaction pattern





end