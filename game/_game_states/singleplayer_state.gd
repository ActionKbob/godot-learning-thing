class_name SingleplayerState
extends GameState


func enter( _data : Dictionary = {} ) -> void :
	print( "SHIP INTERIOR ENTER" );
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );
	
	state_ready.emit();


func exit() -> void :
	print( "SHIP INTERIOR EXIT" );
