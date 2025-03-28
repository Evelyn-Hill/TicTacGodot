extends Button



func _ready() -> void:
  pressed.connect(func(): 
    SignalBus.start_cutscene.emit()
    get_parent().get_parent().get_parent().visible = false
    )
