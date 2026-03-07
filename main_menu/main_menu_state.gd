class_name MainMenuState
extends State

func enter( _data : Dictionary = {} ) -> void :
	SceneManager.scene_load_finished.connect( _on_scene_load );
	SceneManager.transition_to_scene( "res://main_menu/main_menu.tscn" );


func exit() -> void :
	SceneManager.scene_load_finished.disconnect( _on_scene_load );
	print( "MAIN MENU EXIT" )


func _on_scene_load() -> void :
	SceneManager.hide_loading_screen();
