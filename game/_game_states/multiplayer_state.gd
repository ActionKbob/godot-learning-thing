class_name MultiplayerState
extends GameState


func enter( _data : Dictionary = { "type" : "host" } ) -> void :
	print( "MULTIPLAYER ENTER", _data["type"] )
	
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );
	
	match _data["type"] :
		"host" :
			NetworkManager.server_created.connect( _on_connection_established, CONNECT_ONE_SHOT  );
			NetworkManager.host_game();
			pass;
			
		"join" :
			NetworkManager.client_connected.connect( _on_connection_established, CONNECT_ONE_SHOT );
			NetworkManager.join_game();
			pass;	


func exit() -> void :
	print( "MULTIPLAYER EXIT" );


func _on_connection_established() -> void :
	state_ready.emit();
