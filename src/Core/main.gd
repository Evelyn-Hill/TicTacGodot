extends Node

func _ready() -> void:
  SignalBus.new_game.connect(new_game)

func _input(event: InputEvent) -> void:
  if event.is_action_pressed("restart"):  
    new_game()
  if event.is_action_pressed("exit_game"):
    exit_game()
    
func new_game() -> void:
    if self.has_node("game"):
      var old_game : Game = get_node("game")
      if old_game != null: 
        old_game.free()
    
    var game : Game = Game.new()
    add_child(game)
    game.name = "game"
    
func exit_game() -> void:
    if self.has_node("game"):
      var old_game : Game = get_node("game")
      if old_game != null: 
        old_game.destroy_self()
