extends Node

signal scene_load_started( path : String );
signal scene_load_finished( path : String );

var loading_screen_scene : PackedScene = preload( "res://scenes/load_screen.tscn" );

var _current_scene : Node = null;
var _loading_screen : Node = null;

var _pending_scene_path : String = "";

func _ready() -> void :
	_current_scene = get_tree().current_scene;


func _process( _delta: float ) -> void :
	if !_pending_scene_path :
		return;
		
	var status = ResourceLoader.load_threaded_get_status( _pending_scene_path );
	
	match status :
		ResourceLoader.THREAD_LOAD_IN_PROGRESS :
			print( "PROGRESS: ", status )
			
		ResourceLoader.THREAD_LOAD_LOADED :
			var packed : PackedScene = ResourceLoader.load_threaded_get( _pending_scene_path );
			_finish_scene_load( packed, _pending_scene_path );
			_pending_scene_path = "";
			set_process( false );


func transition_to_scene( path : String ) -> void :
	scene_load_started.emit( path );
	
	if loading_screen_scene :
		_loading_screen = loading_screen_scene.instantiate();
		get_tree().root.add_child.call_deferred( _loading_screen );
	
	ResourceLoader.load_threaded_request( path );
	set_process( true );

	_pending_scene_path = path;
	

func hide_loading_screen() -> void :
	if _loading_screen :
		_loading_screen.queue_free();
		_loading_screen = null;


func _finish_scene_load( packedScene : PackedScene, path : String ) -> void :
		
	if _current_scene :
		_current_scene.free();
		
	_current_scene = packedScene.instantiate();
	get_tree().root.add_child( _current_scene );
	get_tree().current_scene = _current_scene;
	
	scene_load_finished.emit();
	
		
	
