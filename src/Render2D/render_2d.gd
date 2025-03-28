class_name Render2d
extends Node2D

const RENDER_SQUARE_SCENE : PackedScene = preload("res://scenes/RenderSquare.tscn")

const INSTANCE_OFFSET : float = 260

var render_squares : Dictionary[Vector2i, RenderSquare] = {}


func _enter_tree() -> void:
  SignalBus.game_state_updated.connect(consume_state)

func consume_state(game : Game):
  
  if game.my_game_state == Game.GameState.NONE:
    for square in render_squares:
      render_squares[square].queue_free()
    
    render_squares.clear()  
    return
    
  
  if render_squares.is_empty():
    %Camera2D.make_current()
    generate_board(game.board)
    instantiate_board(render_squares)
  else:
    update_board(game.board)
  
  
  
func generate_board(board : Dictionary[Vector2i, Square]) -> void:
  for key in board:
    var render_square : RenderSquare = RENDER_SQUARE_SCENE.instantiate() as RenderSquare
    render_square.my_grid_position = key
    render_square.my_value = board[key].get_square_value()
    render_square.set_render_state(board[key].current_piece)
    render_squares[key] = render_square

func instantiate_board(to_render : Dictionary[Vector2i, RenderSquare]):
  for key in to_render:
      %RenderSquares.add_child(to_render[key])
      to_render[key].position = key * INSTANCE_OFFSET
  
func update_board(board : Dictionary[Vector2i, Square]) -> void:
  for key in board:
    var render_square = render_squares[key]
    render_square.set_render_state(board[key].current_piece)
  
  
  
