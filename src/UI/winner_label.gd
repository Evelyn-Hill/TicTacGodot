extends Label

const WINNER_PREPEND_TEXT : String = "Winner: "

func _ready() -> void:
  SignalBus.winner_found.connect(handle_win_condition)
  SignalBus.game_state_updated.connect(handle_game_state_updated)
  
func handle_win_condition(piece : Square.Pieces):
  if piece == Square.Pieces.X:
    self.text = WINNER_PREPEND_TEXT + "Green"
  elif piece == Square.Pieces.O:
    self.text = WINNER_PREPEND_TEXT + "Purple"
  
  self.visible = true
  
func handle_game_state_updated(game : Game):
  if game.my_game_state != Game.GameState.WIN:
    self.visible = false
    
  if game.my_game_state == Game.GameState.TIE:
    self.text = "OMG TIE!"
    self.visible = true
  

    
