extends StateMachine


func _init() -> void :
	register_state( "main_menu", MainMenuState.new() );
	register_state( "singleplayer", SingleplayerState.new() );
	register_state( "multiplayer", MultiplayerState.new() );
	#register_state( "host_game", HostGameState.new() );
	#register_state( "join_game", JoinGameState.new() );
