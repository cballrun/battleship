class Player
  attr_reader :board,
              :ships
  def initialize
    @board = Board.new
    @ships = []
  end

  def add_ship(ship)
    @ships << ship
  end

  def player_greeting
    puts
    puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
    puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    puts
    puts "I have laid out my ships on the grid."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three squares long and"
    puts "the Submarine is two squares long."
    puts
    puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
    puts
    puts "This is your BOARD:"
    puts
  end

  def player_cruiser_placement
    player_greeting
    cruiser = Ship.new("Cruiser", 3)
    add_ship(cruiser)
    puts @board.render
    puts
    puts "Cruiser placement:"
    puts "Select your first coordinate:"
    puts
    first_coordinate = gets.chomp
    puts
    puts "Select your second coordinate:"
    puts
    second_coordinate = gets.chomp
    puts
    puts "Select your final coordinate:"
    puts
    third_coordinate = gets.chomp
    puts
    puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    puts
    player_input = [first_coordinate, second_coordinate, third_coordinate]
    if @board.valid_placement?(cruiser, player_input) == false
      puts "Those coordinates are not valid!"
      puts "Try again..."
      player_cruiser_placement_loop
    else
      @board.place(cruiser, player_input)
      puts @board.render(true)
      puts
      puts "Your Cruiser is placed."
      puts
      puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    end
  end

  def player_submarine_placement
    submarine = Ship.new("Submarine", 2)
    add_ship(submarine)
    puts @board.render
    puts
    puts "Submarine placement:"
    puts "Select your first coordinate:"
    puts
    first_coordinate = gets.chomp
    puts
    puts "Select your second coordinate:"
    puts
    second_coordinate = gets.chomp
    puts
    puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    puts
    player_input = [first_coordinate, second_coordinate]
    if @board.valid_placement?(submarine, player_input) == false
      puts "Those coordinates are not valid!"
      puts "Try again..."
      player_submarine_placement_loop
    else
      @board.place(submarine, player_input)
      puts @board.render(true)
      puts
      puts "Your Submarine is placed."
      puts
      puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
    end
  end

  def player_fire_prompt
    puts "Enter a coordinate to fire at:"
  end

  def player_cruiser_placement_loop
    player_cruiser_placement
  end

  def player_submarine_placement_loop
    player_submarine_placement
  end
end