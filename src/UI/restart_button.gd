extends Button



func _ready() -> void:
  self.pressed.connect(func(): SignalBus.restart_game.emit())
  SignalBus.game_state_updated.connect(handle_game_state)

func handle_game_state(game : Game) -> void:
  if game.my_game_state == Game.GameState.WIN or game.my_game_state == Game.GameState.TIE:
    self.visible = true
  else:
    self.visible = false
