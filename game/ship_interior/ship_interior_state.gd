class_name ShipInteriorState
extends State


func enter( _data : Dictionary = {} ) -> void :
	SceneManager.scene_load_finished.connect( _on_scene_load );
	SceneManager.transition_to_scene( "res://game/ship_interior/ship_interior.tscn" );


func exit() -> void :
	print( "SHIP INTERIOR EXIT" );


func _on_scene_load() -> void :
	SceneManager.hide_loading_screen();
