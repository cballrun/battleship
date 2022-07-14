require './lib/cell'


# Testing ranges and .zip/.map



# p grid_column_a = ('A1'..'A4').to_a

# p grid_column_b = ('B1'..'B4').to_a

# p grid_column_c = ('C1'..'C4').to_a

# p grid_column_d = ('D1'..'D4').to_a

# x = ('A'..'D').to_a
# y = ('1'..'4').to_a

# p x.zip(y).map { |x| x.join }


# p "A1".ord
# p "B2".ord
# p "C3".ord
# p "D4".ord

# p "1".ord

# p "2".ord

# # each_cons



arr = ["A1", "A2", "A4"]

arr_p = (arr).each_cons(2).to_a



arr_p

(arr_p[1][0]..arr_p[1][1]).to_a.length > 2


# def test(coordinate)
#   array = (coordinate).each_cons(2).to_a
#   if (array[0][0]..array[0][1]).to_a.length > 2 
#     return false
#   elsif (array[1][0]..array[1][1]).to_a.length > 2
#     return false
#   end 
# end

# test(["A3", "A2", "A1"])

# # require 'pry'; binding.pry
# ("A2".."A4").to_a





grid = {}

grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a

grid_coordinates.each {|coordinate| grid[coordinate] = Cell.new(coordinate)}
require 'pry'; binding.pry
p grid.values

# # %w[foo, bar] = ["foo", "bar"]