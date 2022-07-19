class Game
  attr_reader :player,
              :computer
  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def greeting
    puts
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts
    puts "Your opponent has laid out their ships."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three squares long and"
    puts "the Submarine is two squares long."
    puts
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts
    cruiser_placement_prompt
  end

  def cruiser_placement_prompt
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
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
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
      puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
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
    puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
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
      puts "🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
      puts
      turn
    end
  end

  def start
    puts welcome
    input = gets.chomp
    if input == "q"
      puts
      puts "The only winning move is not to play..."
      puts
    elsif input == "p"
      puts
      puts "Your opponent is placing their ships..."
      puts
      #computer start placement method / Greeting
    else
      puts
      puts "Invalid input. Try again..."
      puts
      start
    end
  end

  def welcome
    puts
    puts
    puts "🌊🌊🌊💥🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts "🌊💥🚢🌊🌊🌊 ={ BATTLESHIP }= 🌊🌊💥🌊🌊🌊"
    puts "🌊🌊🌊🌊💥🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊💥🌊🚢🌊🌊"
    puts
    puts "          WELCOME TO BATTLESHIP"
    puts
    puts "     Enter p to play. Enter q to quit."
    puts
    puts
  end

  def turn
    puts
    puts "={ COMPUTER BOARD }="
    puts
    puts @computer.cpu_board.render
    puts
    puts
    puts " ={ PLAYER BOARD }="
    puts
    puts @player.board.render(true)
    puts
    # computer fire control
  end
end