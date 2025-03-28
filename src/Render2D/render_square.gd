class_name RenderSquare
extends Sprite2D

var my_state: Square.Pieces = Square.Pieces.NONE

var my_value : int
var my_grid_position : Vector2i

func _ready() -> void:
  %MouseDetectionArea.input_event.connect(handle_input_event)

func handle_input_event(viewport : Node, event: InputEvent, shape_idx: int) -> void:
  if event is InputEventMouseButton:
    var e : InputEventMouseButton = event as InputEventMouseButton
    if e.is_action_pressed("click_square"):
      var input_packet: InputPacket = InputPacket.new(my_grid_position)
      SignalBus.input_event.emit(input_packet)
    

func set_render_state(state : Square.Pieces):  
  my_state = state
  enable_visual(my_state)

func enable_visual(render_state : Square.Pieces):
  if my_state == Square.Pieces.X:
    %GreenDiamond.visible = true
  elif my_state == Square.Pieces.O:
    %PurplePolygon.visible = true
  else:
    %PurplePolygon.visible = false
    %GreenDiamond.visible = false

    
