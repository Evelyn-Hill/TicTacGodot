class_name Square
extends RefCounted

enum Pieces {
  NONE,
  X,
  O,
} 
  
var current_piece : Pieces = Pieces.NONE
var _value_for_magic_square : int

func _init(value : int):
  _value_for_magic_square = value

func set_current_piece(piece : Pieces) -> Square:
  if current_piece == Pieces.NONE:
    current_piece = piece
    return self
  else:
    return self

func get_square_value() -> int:
  return _value_for_magic_square

func get_current_piece() -> Pieces:
  return current_piece
