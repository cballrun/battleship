class Game
  attr_reader :player,
              :computer
  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def greeting
    @computer.cruiser_coord_generator
    @computer.sub_coord_generator
    puts
    puts "🌊🌊🌊🌊🌊🚢🚢🚢🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
    puts "🌊🌊🚢🚢🌊🌊🌊🌊🌊🌊🌊🌊🚢🚢🌊🌊🌊🌊🌊🌊"
    puts
    puts "Your opponent has laid out their ships."
    puts "You now need to lay out your two ships."
    puts "The Cruiser is three squares long and"
    puts "the Submarine is two squares long."
    puts
    puts "🌊🌊🌊🚢🚢🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🚢🚢🚢🌊🌊"
    puts "🌊🌊🌊🌊🌊🌊🚢🚢🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊🌊"
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
      greeting
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
  end

  def turn
    puts "={ COMPUTER BOARD }="
    puts
    puts @computer.cpu_board.render
    puts
    puts
    puts " ={ PLAYER BOARD }="
    puts
    puts @player.board.render(true)
    puts
        cpu_fire
        @player.ships.each do |ship|
          if ship.sunk? == true
            puts "Your #{ship.name} has been sunk!"
          end
        end
        @computer.ships.each do |ship|
          if ship.sunk? == true
            puts "You sunk their #{ship.name}!"
          end
        end
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
    puts "Enter a coordinate to fire upon:"
    puts
    puts "...or press q to leave the game."
    puts
    player_fire
    if @computer.defeat? == true
      game_over
    elsif @player.defeat? == true
      game_over
    else
      turn
    end
  end

  def cpu_fire
    x = ["1", "2", "3", "4"]
    y = ["A", "B", "C", "D"]
    coord_to_fire_upon = y.sample + x.sample
      if @player.board.cells[coord_to_fire_upon].taken_fire == false
         @player.board.cells[coord_to_fire_upon].fire_upon
        puts "Your opponent fired on coordinate #{coord_to_fire_upon}"
        if @player.board.cells[coord_to_fire_upon].empty? == true
            puts
            puts "It's a MISS!"
            puts
        else
            puts
            puts "It's a HIT!"
            puts
        end
      else
        cpu_fire
    end
  end

  def player_fire
    coord_to_fire_upon = gets.chomp

    if coord_to_fire_upon == "q"
      puts "See you next time..."
      exit!
    end

    if @computer.cpu_board.valid_coordinate?(coord_to_fire_upon) == false
      puts "That isn't on the board. Try again."
      player_fire
    elsif
      @computer.cpu_board.cells[coord_to_fire_upon].taken_fire == false
      @computer.cpu_board.cells[coord_to_fire_upon].fire_upon
      puts "You fired on coordinate #{coord_to_fire_upon}"
        if @computer.cpu_board.cells[coord_to_fire_upon].empty? == true
          puts
          puts "It's a MISS!"
          puts
      else
          puts
          puts "It's a HIT!"
          puts
        end
    else
      puts
      puts "You've already shot at that space. Try again."
      puts
      player_fire
    end
  end

  def game_over
    if @computer.defeat? == true
      puts
      puts "You sunk my battleship!"
      puts
    else
      puts
      puts "Better luck next time..."
      puts
    end
  end
end

