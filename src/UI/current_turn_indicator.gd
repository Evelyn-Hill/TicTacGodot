class_name CurrentTurnLabel
extends Control

const green_image : Texture2D = preload("res://assets/Sprites/element_green_diamond.png")
const purple_image : Texture2D = preload("res://assets/Sprites/element_purple_polygon.png")


func _enter_tree() -> void:
  SignalBus.game_state_updated.connect(handle_state_update)

func handle_state_update(game : Game) -> void:
  
  if game.my_game_state == Game.GameState.PLAYING:
    self.visible = true
  else:
    self.visible = false
      
  if game.current_turn == Square.Pieces.X:
    %TextureRect.texture = green_image
  elif game.current_turn == Square.Pieces.O:
    %TextureRect.texture = purple_image
