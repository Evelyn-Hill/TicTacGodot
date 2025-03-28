class_name Game
extends Node

# Data Structure First 

var board : Dictionary[Vector2i, Square] = {
  Vector2i(-1, -1): Square.new(2), Vector2i(0, -1): Square.new(7), Vector2i(1, -1): Square.new(6),
  Vector2i(-1, 0): Square.new(9), Vector2i(0, 0): Square.new(5), Vector2i(1, 0): Square.new(1),
  Vector2i(-1, 1): Square.new(4), Vector2i(0, 1): Square.new(3), Vector2i(1, 1): Square.new(8),
}

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
 
# Because of this, any winning combination will add up to 15. So we can append the square value to a "score"
# each move and just check if either player has a score of 15 every move.

var current_turn : Square.Pieces = Square.Pieces.X

enum GameState {
  NONE,
  PLAYING,
  WIN,
  TIE,
}

var my_game_state : GameState = GameState.NONE

func _ready() -> void:
  my_game_state = GameState.PLAYING
  SignalBus.game_state_updated.emit(self)
  SignalBus.input_event.connect(_consume_input)
  
func _consume_input(input_packet : InputPacket):
  place_piece(input_packet.position, current_turn)

func retrieve_square(position : Vector2i) -> Square:  
  if not board.has(position):
    printerr("Attempting to index a board position that does not exist! " + str(position))
    return null

  return board[position]

func place_piece(position : Vector2i, piece : Square.Pieces) -> void:
  if not my_game_state == GameState.PLAYING:
    return
    
  if not board.has(position):
    printerr("Attemping to index a board position that does not exist!" + str(position)) 
    return
  
  var square = board[position] as Square
  square = square.set_current_piece(piece) 
  board[position] = square
  current_turn = next_player_turn()
 
  
  if check_winner() != 0:
    handle_win_condition(check_winner())
  
  SignalBus.game_state_updated.emit(self)
  

  # After appending score, we just check if theres a winner

# This only has to check for value because of the Magic Square
func check_winner() -> Square.Pieces:
  for array in winning_options:
    var pieces : Array
    for vector in array:
      pieces.append(board[vector].get_current_piece())
      
    if pieces.count(Square.Pieces.X) == 3:
      return Square.Pieces.X
    elif pieces.count(Square.Pieces.O) == 3:
      return Square.Pieces.O
      
  var accum : int = 0
  for key in board:
    if board[key].current_piece != Square.Pieces.NONE:
      accum += 1
    
  if accum == 9:
    my_game_state = GameState.TIE
    print("Tie!")
    
  return Square.Pieces.NONE
      

func handle_win_condition(winner : Square.Pieces):
  SignalBus.winner_found.emit(winner)
  my_game_state = GameState.WIN

func next_player_turn() -> Square.Pieces:
  if current_turn == Square.Pieces.X:
    return Square.Pieces.O
  elif current_turn == Square.Pieces.O:
    return Square.Pieces.X
  
  return current_turn

func destroy_self() -> void:
  my_game_state = GameState.NONE
  SignalBus.game_state_updated.emit(self)
