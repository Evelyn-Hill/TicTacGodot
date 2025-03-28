extends Node

func _ready() -> void:
  SignalBus.restart_game.connect(restart_game)

func _input(event: InputEvent) -> void:
  if event.is_action_pressed("restart"):  
    restart_game()
    
func restart_game() -> void:
    get_node("game").free()
    var game : Game = Game.new()
    add_child(game)
    game.name = "game"
