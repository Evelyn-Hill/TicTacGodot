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
  game.my_game_state = Game.GameState.PLAYING
  game.place_piece(Vector2(0, 0), Square.Pieces.X)
  var check_result := game.board[Vector2i(0, 0)]
  assert_int(check_result.get_current_piece()).is_equal(Square.Pieces.X)

  game.free()
  
func test_check_winner():
  var winning_options : Array = [
  [Vector2i(-1, -1), Vector2i(0, -1), Vector2i(1, -1)],
  [Vector2i(-1, 0), Vector2i(0, 0), Vector2i(1, 0)],
  [Vector2i(-1, 1), Vector2i(0, 1), Vector2i(1, 1)],
  [Vector2i(-1, -1), Vector2i(-1, 0), Vector2i(-1, 1)],
  [Vector2i(0, -1), Vector2i(0, 0), Vector2i(0, 1)],
  [Vector2i(1, -1), Vector2i(1, 0), Vector2i(1, 1)],
  [Vector2i(-1, -1), Vector2i(0, 0), Vector2i(1, 1)],
  [Vector2i(-1, 1), Vector2i(0, 0), Vector2i(1, -1)],
  ]
  
  for array in winning_options:
    var game : Game = Game.new()
    game.my_game_state = Game.GameState.PLAYING
    for vector in array:
      game.place_piece(vector, Square.Pieces.X)
    
    var winner : Square.Pieces = game.check_winner()
    assert_int(winner).is_equal(1)
    game.free()
      
  
  
  
