extends StateMachine


func _init() -> void :
	register_state( "main_menu", MainMenuState.new() );
	register_state( "singleplayer", SingleplayerState.new() );
