extends Node
@warning_ignore('unused_signal')
signal game_state_updated(game : Game)
@warning_ignore('unused_signal')
signal winner_found(piece : Square.Pieces)
@warning_ignore('unused_signal')
signal input_event(input_packet : InputPacket)
@warning_ignore('unused_signal')
signal new_game()

@warning_ignore('unused_signal')
signal start_doom()

@warning_ignore('unused_signal')
signal start_cutscene
