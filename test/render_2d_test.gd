# GdUnit generated TestSuite
class_name Render2dTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

# TestSuite generated from
const __source = 'res://src/Render2D/render_2d.gd'


func test_generate_board() -> void:
  var board : Dictionary[Vector2i, Square] = {
  Vector2i(-1, -1): Square.new(2), Vector2i(0, -1): Square.new(7), Vector2i(1, -1): Square.new(6),
  Vector2i(-1, 0): Square.new(9), Vector2i(0, 0): Square.new(5), Vector2i(1, 0): Square.new(1),
  Vector2i(-1, 1): Square.new(4), Vector2i(0, 1): Square.new(3), Vector2i(1, 1): Square.new(8),
  }
  
  var render : Render2d = Render2d.new()
  
  render.generate_board(board)
  
  for key in board:
    assert_vector(render.render_squares[key].my_grid_position).is_equal(key)
    assert_int(render.render_squares[key].my_value).is_equal(board[key].get_square_value())
    assert_int(render.render_squares[key].my_state).is_equal(board[key].get_current_piece())
  
  for item in render.render_squares:
    render.render_squares[item].free()
  
  render.free()
  
