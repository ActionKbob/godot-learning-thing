class_name MainMenuState
extends GameState

func enter( _data : Dictionary = {} ) -> void :
	print( "MAIN MENU ENTER" );
	SceneManager.transition_to_scene( "res://main_menu/main_menu.tscn" );

	super.enter();

func exit() -> void :
	print( "MAIN MENU EXIT" )
