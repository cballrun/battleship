class Game
  attr_reader :player
  def initialize
   # computer = Computer.new
    @player = Player.new
  end

  def greeting
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
  end

  def cruiser_placement_prompt
    greeting
    puts "This is your BOARD:"
    puts
    puts @player.board.render
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
    puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
    puts
    if @player.player_cruiser_placement(first_coordinate, second_coordinate, third_coordinate) == false
      puts "Those coordinates are not valid!"
      puts "Try again..."
      puts
      cruiser_placement_prompt
    else
      puts @player.board.render(true)
      puts
      puts "Your Cruiser is placed."
      puts
      puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
      puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
      puts
      submarine_placement_prompt
    end
  end

  def submarine_placement_prompt
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
    puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
    puts
    if @player.player_submarine_placement(first_coordinate, second_coordinate) == false
      puts "Those coordinates are not valid!"
      puts "Try again..."
      puts
      submarine_placement_prompt
    else
      puts @player.board.render(true)
      puts
      puts "Your Submarine is placed."
      puts
      puts "^><^><^><^><^><^><^>^<^><^><^><^><^><^"
      puts "><^><^><^><^><^><^><^>^<^><^><^><^><^>"
    end
  end
end