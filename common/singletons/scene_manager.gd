extends Node

signal scene_load_started( path : String );
signal scene_load_finished( path : String );

var _current_scene : Node = null;
#var _pending_scene_path : String = "";

func _ready() -> void :
	_current_scene = get_tree().current_scene;

#func _process( _delta: float ) -> void :
	#if !_pending_scene_path :
		#return;
		#
	#var status = ResourceLoader.load_threaded_get_status( _pending_scene_path );
	#
	#match status :
		#ResourceLoader.THREAD_LOAD_IN_PROGRESS :
			#print( "PROGRESS: ", status )
			#
		#ResourceLoader.THREAD_LOAD_LOADED :
			#var packed : PackedScene = ResourceLoader.load_threaded_get( _pending_scene_path );
			#_finish_scene_load( packed, _pending_scene_path );
			#_pending_scene_path = "";
			#set_process( false );


func transition_to_scene( path : String ) -> void :
	scene_load_started.emit( path );
		
	ResourceLoader.load_threaded_request( path );
	#set_process( true );
	
	print( GameStateManager.current_state as GameState )
	await ( GameStateManager.current_state as GameState ).state_ready;
	
	while true :
		var status = ResourceLoader.load_threaded_get_status( path );
		match status :
			ResourceLoader.THREAD_LOAD_IN_PROGRESS :
				print( "PROGRESS: ", status );
				
			ResourceLoader.THREAD_LOAD_LOADED :
				var packed : PackedScene = ResourceLoader.load_threaded_get( path );
				_finish_scene_load( packed );
				break;


func _finish_scene_load( packedScene : PackedScene ) -> void :
		
	if _current_scene :
		_current_scene.queue_free();
		
	_current_scene = packedScene.instantiate();
	_apply_scene.call_deferred( _current_scene );
	
	
func _apply_scene( scene : Node ) -> void :
	get_tree().root.add_child( scene );
	get_tree().current_scene = scene;
	
	scene_load_finished.emit();
	
		
	
