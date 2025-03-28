class_name RenderSquare
extends Sprite2D

var my_state: Square.Pieces = Square.Pieces.NONE

var my_value : int
var my_grid_position : Vector2i

func _ready() -> void:
  %MouseDetectionArea.input_event.connect(handle_input_event)
  %MouseDetectionArea.mouse_entered.connect(func(): Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND))
  %MouseDetectionArea.mouse_exited.connect(func(): Input.set_default_cursor_shape(Input.CURSOR_ARROW))

func handle_input_event(_viewport : Node, event: InputEvent, _shape_idx: int) -> void:
  if event is InputEventMouseButton:
    var e : InputEventMouseButton = event as InputEventMouseButton
    if e.is_action_pressed("click_square"):

      var input_packet: InputPacket = InputPacket.new(my_grid_position)
      SignalBus.input_event.emit(input_packet)
    

func set_render_state(state : Square.Pieces):  
  enable_visual(state)
  my_state = state
  
func enable_visual(state : Square.Pieces):
  if state == my_state:
    return
  if state == Square.Pieces.X:
    %GreenDiamond.visible = true
    %AnimationPlayer.play("GreenDiamondFlyIn")
  elif state == Square.Pieces.O:
    %PurplePolygon.visible = true
    %AnimationPlayer2.play("PurplePolygonFlyIn")
  else:
    %PurplePolygon.visible = false
    %GreenDiamond.visible = false

    
