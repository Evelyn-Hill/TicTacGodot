class_name Game
extends Node

# Data Structure First 

var board : Dictionary[Vector2i, String] = {
  Vector2i(0, 0): " ",
  Vector2i(1, 0): " ",
  Vector2i(2, 0): " ",
  Vector2i(0, 1): " ",
  Vector2i(1, 1): " ",
  Vector2i(2, 1): " ",
  Vector2i(0, 2): " ",
  Vector2i(1, 2): " ",
  Vector2i(2, 2): " ",
}


func retrieve_piece(position : Vector2i) -> String:
  
  if not board.has(position):
    printerr("Attempting to index a board position that does not exist! " + str(position))
    return "null"

  return board[position]


func place_piece(position : Vector2i, piece : String) -> void:
  if not board.has(position):
    printerr("Attemping to index a board position that does not exist!" + str(position)) 
    return

  board[position] = piece




