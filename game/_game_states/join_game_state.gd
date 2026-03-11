class_name JoinGameState
extends GameState


func enter( _data : Dictionary = {} ) -> void :
	print( "JOIN ENTER" );
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );
	
	NetworkManager.join_game();


func exit() -> void :
	print( "JOIN EXIT" );
