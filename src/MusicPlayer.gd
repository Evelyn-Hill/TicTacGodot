extends AudioStreamPlayer

const calm = preload("res://assets/Sound/Short Meditation Music - 3 Minute Relaxation Calming [TubeRipper.cc].ogg")
const doom = preload("res://assets/Sound/Doom Eternal OST - The Only Thing They Fear Is You (Mick Gordon) [Doom Eternal Theme] [TubeRipper.cc].ogg")


func _ready() -> void:
  SignalBus.start_doom.connect(start_doom)
  pass # Replace with function body.

func start_doom():
  self.stream = doom
  play()
