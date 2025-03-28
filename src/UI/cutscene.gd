extends Node2D


func _ready() -> void:
  SignalBus.start_cutscene.connect(start_cutscene)

func start_doom():
  SignalBus.start_doom.emit()
  
func start_cutscene():
  self.visible = true
  %Camera2D.make_current()
  %AnimationPlayer.play("Cutscene")
  %Camera2D.make_current()
  %AnimationPlayer.animation_finished.connect(handle_animation_finished)
  
func handle_animation_finished(anim_name):
  visible = false
  SignalBus.new_game.emit()
