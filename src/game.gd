class_name Game
extends Node

# Data Structure First 

var board : Dictionary[Vector2i, Square] = {
  Vector2i(0, 0): Square.new(4), Vector2i(1, 0): Square.new(9), Vector2i(2, 0): Square.new(2),
  Vector2i(0, 1): Square.new(3), Vector2i(1, 1): Square.new(5), Vector2i(2, 1): Square.new(7),
  Vector2i(0, 2): Square.new(8), Vector2i(1, 2): Square.new(1), Vector2i(2, 2): Square.new(6),
}

# The magic square values for tic-tac-toe are
#
# 4 9 2
# 3 5 7
# 8 1 6
# 
# Because of this, any winning combination will add up to 15. So we can append the square value to a "score"
# each move and just check if either player has a score of 15 every move.


var xScore : int
var oScore : int

enum Players {
  NONE,
  X,
  O
}


func retrieve_square(position : Vector2i) -> Square:  
  if not board.has(position):
    printerr("Attempting to index a board position that does not exist! " + str(position))
    return null

  return board[position]


func place_piece(position : Vector2i, piece : Square.Pieces) -> void:
  if not board.has(position):
    printerr("Attemping to index a board position that does not exist!" + str(position)) 
    return
  
  var square = board[position] as Square
  square = square.set_current_piece(piece) 
  board[position] = square


func append_score_to_player(square : Square):
  if square.current_piece == Square.Pieces.X:
    xScore += square.get_square_value()
  elif square.current_piece == Square.Pieces.O:
    oScore += square.get_square_value()
  else:
    return
  
  # After appending score, we just check if theres a winner
  check_winner()


# This only has to check for value because of the Magic Square
func check_winner() -> Players:
  if xScore == 15:
    return Players.X
  elif oScore == 15:
    return Players.O
  
  return Players.NONE

func _ready():
  check_winner()
