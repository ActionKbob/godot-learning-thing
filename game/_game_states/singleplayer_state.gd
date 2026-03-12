class_name SingleplayerState
extends GameState


func enter( _data : Dictionary = {} ) -> void :
	print( "SINGLE PLAYER ENTER" );
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );
	PlayerRegistry.register_player( 1 );
	
	state_ready.emit();


func exit() -> void :
	print( "SINGLE PLAYER EXIT" );
