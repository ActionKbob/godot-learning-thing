class_name HostGameState
extends GameState


func enter( _data : Dictionary = {} ) -> void :
	print( "HOST ENTER" )
	NetworkManager.server_created.connect( _on_server_created );
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );
	
	NetworkManager.host_game();


func exit() -> void :
	print( "HOST EXIT" );
	NetworkManager.server_created.disconnect( _on_server_created );


func _on_server_created() -> void :
	state_ready.emit();
