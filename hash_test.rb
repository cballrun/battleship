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






# ["A1", "C1"]

# ["A3", "A2", "A1"]

# ["C1", "B1"]

# coordinate = ["A1", "A2", "A4"]

# coordinate_pair = (coordinate).each_cons(2).to_a

# p coordinate_pair

# p coordinate_pair[0][1]

# p coordinate_pair[0][1][1]


# # X coordinate (right to left from array)
# p ("#{coordinate_pair[1][1][1]}".ord) - ("#{coordinate_pair[1][0][1]}".ord) != 1

# # Y coordinate (right to left from array)
# p ("#{coordinate_pair[1][1][0]}".ord) - ("#{coordinate_pair[1][0][0]}".ord) != 1


# p "C".ord

# p "B".ord


# (arr_p[1][0]..arr_p[1][1]).to_a.length > 2


# def test(coordinate)
#   array = (coordinate).each_cons(2).to_a
#   if (array[0][0]..array[0][1]).to_a.length > 2
#     return false
#   elsif (array[1][0]..array[1][1]).to_a.length > 2
#     return false
#   end
# end

# test(["A3", "A2", "A1"])

# # # require 'pry'; binding.pry
# # ("A2".."A4").to_a


# grid = {}

# grid_coordinates = ('A1'..'A4').to_a + ('B1'..'B4').to_a + ('C1'..'C4').to_a + ('D1'..'D4').to_a

# grid_coordinates.each {|coordinate| grid[coordinate] = Cell.new(coordinate)}


# coordinate = ["B3", "C3", "D3"]

# p (coordinate.all? {|coord| coord[0].include? coordinate[0][0]} || coordinate.all? {|coord| coord[1].include? coordinate[0][1]})


# p coordinate.all? do |coord|
#     coord[0].include?(coordinate[0][0])
#   end

# coordinate.each do |coord|
#   require 'pry'; binding.pry
#   coord.include?(coordinate[0][0])
# [1, 2, 3, 4, 5, 6].each_cons(3)




# coordinate_pair = (coordinate).each_cons(2).to_a

# p coordinate_pair

# p coordinate_pair[0][1]

# p coordinate_pair[0][1][1]

# # X coordinate_pair block 0 (right to left from array)
# p ((coordinate_pair)[0][1][1].ord) - ((coordinate_pair)[0][0][1].ord) != 1

# # Y coordinate_pair block 0 (right to left from array)
# p ((coordinate_pair)[0][1][0].ord) - ((coordinate_pair)[0][0][0].ord) != 1

# # X coordinate_pair block 1 (right to left from array)
# p ((coordinate_pair)[1][1][1].ord) - ((coordinate_pair)[1][0][1].ord) != 1

# # Y coordinate_pair block 1 (right to left from array)
# p ((coordinate_pair)[1][1][0].ord) - ((coordinate_pair)[1][0][0].ord) != 1


coordinate = ["A1", "B2", "C3"]

x_coord = coordinate.map { |coord| coord[1 ]}

y_coord = coordinate.map { |coord| coord[0] }

((false) && (true)) && ((true) && (true))

p x_coord

p y_coord

p y_coord.uniq.length = coordinate.length && x_coord.uniq.length = coordinate.length

# Determines if placement order is right-to-left or top-to-bottom by comparing ord value
p (x_coord[-1].ord < x_coord[-2].ord && x_coord[0].ord < x_coord[1].ord)


p (y_coord[-1].ord > y_coord[-2].ord && y_coord[0].ord < y_coord[1].ord)

p "1".ord

p "2".ord


ship_length = 3
# Determines if placement is consecutive by comparing minmax array length to ship length
p (((y_coord.minmax[0])..(y_coord.minmax[1])).to_a.length > ship_length)

p (((x_coord.minmax[0])..(x_coord.minmax[1])).to_a.length > ship_length)
