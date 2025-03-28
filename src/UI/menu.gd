extends Control



func _ready() -> void:
  SignalBus.game_state_updated.connect(consume_game_state)
  
func consume_game_state(game : Game) -> void:
  if game.my_game_state != Game.GameState.NONE:
    self.visible = false
    self.mouse_filter = MouseFilter.MOUSE_FILTER_IGNORE
  else:
    self.visible = true
    self.mouse_filter = MouseFilter.MOUSE_FILTER_STOP
