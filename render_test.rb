
require './lib/board'
require './lib/cell'
require './lib/ship'

board = Board.new

def render

  puts "  1 2 3 4 \n" + 
  "A" + " " + board.cells["A1"].render + " " + board.cells["A2"].render + " " + board.cells["A3"].render + " " + board.cells["A4"].render + "\n" +
  "B" + " " + board.cells["B1"].render + " " + board.cells["B2"].render + " " + board.cells["B3"].render + " " + board.cells["B4"].render + "\n" +
  "C" + " " + board.cells["C1"].render + " " + board.cells["C2"].render + " " + board.cells["C3"].render + " " + board.cells["C4"].render + "\n" +
  "D" + " " + board.cells["D1"].render + " " + board.cells["D2"].render + " " + board.cells["D3"].render + " " + board.cells["D4"].render 
end

board.render

