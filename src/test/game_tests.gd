extends GdUnitTestSuite


func test_retrieve_piece():
  var game : Game = Game.new()
  # Known Value to Test on.
  game.board = {
    Vector2i(0, 0): " ",
    Vector2i(1, 0): "x",
    Vector2i(2, 0): " ",
    Vector2i(0, 1): " ",
    Vector2i(1, 1): " ",
    Vector2i(2, 1): " ",
    Vector2i(0, 2): " ",
    Vector2i(1, 2): " ",
    Vector2i(2, 2): " ",
  }
  
  var should_exist := game.retrieve_piece(Vector2i(1, 0))
  assert_str(should_exist).is_equal("x")

  var should_not_exist := game.retrieve_piece(Vector2(7, 7))
  assert_str(should_not_exist).is_equal("null")

  game.free()


func test_place_piece():
  var game : Game = Game.new()
  game.place_piece(Vector2(0, 0), "x")

  var check_result := game.retrieve_piece(Vector2i.ZERO)
  assert_str(check_result).is_equal("x")

  game.free()
