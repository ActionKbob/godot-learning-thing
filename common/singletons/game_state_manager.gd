extends StateMachine

func _init() -> void :
	register_state( "main_menu", MainMenuState.new() );
	register_state( "ship_interior", ShipInteriorState.new() );
