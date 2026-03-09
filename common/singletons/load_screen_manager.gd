extends Node

var loading_screen_scene : PackedScene = preload( "res://scenes/load_screen.tscn" );


func _ready() -> void :
	SceneManager.scene_load_started.connect( _on_scene_load_start );
	SceneManager.scene_load_finished.connect( _on_scene_load_finished );
	

func _on_scene_load_start( _path : String ) -> void :
	pass


func _on_scene_load_finished() -> void :
	pass
