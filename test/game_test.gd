class_name GameTest
extends GdUnitTestSuite
@warning_ignore('unused_parameter')
@warning_ignore('return_value_discarded')

const __source = 'res://src/game.gd'


func test_retrieve_square():
  var game : Game = Game.new()
  
  # Custom Insertion code to avoid test collision
  var square := Square.new(4)
  square.set_current_piece(Square.Pieces.X)
  game.board[Vector2i(0, 0)] = square


  var should_exist := game.retrieve_square(Vector2i(0, 0))
  # Enums are converted to ints on the back end.
  assert_int(should_exist.get_current_piece()).is_equal(Square.Pieces.X)

  var should_not_exist := game.retrieve_square(Vector2(7, 7))
  assert_object(should_not_exist).is_equal(null)

  game.free()


func test_place_piece():
  var game : Game = Game.new()
  game.place_piece(Vector2(0, 0), Square.Pieces.X)
  var check_result := game.board[Vector2i(0, 0)]
  assert_int(check_result.get_current_piece()).is_equal(Square.Pieces.X)

  game.free()


func test_append_score_to_player():
  var game : Game = Game.new()
  var square : Square = Square.new(4)
  
  # Test X
  square.set_current_piece(Square.Pieces.X)
  game.append_score_to_player(square)
  assert_int(game.xScore).is_equal(4)
  assert_int(game.oScore).is_equal(0)
  game.xScore = 0
  
  # Test O
  square = Square.new(2)
  square.set_current_piece(Square.Pieces.O)
  game.append_score_to_player(square)
  assert_int(game.oScore).is_equal(2)
  assert_int(game.xScore).is_equal(0)
  
  game.xScore = 0
  game.oScore = 0
  
  # Test NONE
  square = Square.new(1)
  game.append_score_to_player(square)
  assert_int(game.oScore).is_equal(0)
  assert_int(game.xScore).is_equal(0)
  
  game.free()
  
func test_check_winner():
  var game : Game = Game.new()
  
  # Test X
  game.xScore = 15
  var result := game.check_winner()
  assert_int(result).is_equal(1)
  game.xScore = 0
  
  # TestO
  game.oScore = 15
  result = game.check_winner()
  assert_int(result).is_equal(2)
  
  # Test None
  game.oScore = 0
  result = game.check_winner()
  assert_int(result).is_equal(0)
  
  game.free()
  
