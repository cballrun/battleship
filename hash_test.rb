require './lib/cell'


# Testing ranges and .zip/.map



p grid_column_a = ('A1'..'A4').to_a

p grid_column_b = ('B1'..'B4').to_a

p grid_column_c = ('C1'..'C4').to_a

p grid_column_d = ('D1'..'D4').to_a

x = ('A'..'D').to_a
y = ('1'..'4').to_a

p x.zip(y).map { |x| x.join }






# Testing hash generation 

grid = {}

grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a

grid_coordinates.each {|coordinate| grid[coordinate] = Cell.new(coordinate)}

p grid

# %w[foo, bar] = ["foo", "bar"]