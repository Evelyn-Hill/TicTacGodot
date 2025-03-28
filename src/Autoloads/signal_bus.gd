extends Node

signal game_state_updated(game : Game)
signal winner_found(piece : Square.Pieces)
signal input_event(input_packet : InputPacket)
signal restart_game()
