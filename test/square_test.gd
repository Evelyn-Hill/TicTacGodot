# GdUnit generated TestSuite
class_name SquareTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/square.gd'


func test_set_current_piece() -> void:
  var square : Square = Square.new(4)
  square.set_current_piece(Square.Pieces.X)
  assert_int(square.current_piece).is_equal(Square.Pieces.X)


func test_get_square_value() -> void:
  var square : Square = Square.new(4)
  assert_int(square._value_for_magic_square).is_equal(4)


func test_get_current_piece() -> void:
  var square : Square = Square.new(4)
  square.current_piece = Square.Pieces.X
  assert_int(square.get_current_piece()).is_equal(Square.Pieces.X)
