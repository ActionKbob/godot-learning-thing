extends CanvasLayer


func _ready() -> void :
	layer = 10;
	SceneManager.scene_load_started.connect( _on_scene_load_start );
	SceneManager.scene_load_finished.connect( _on_scene_load_finished );
	hide();

func _on_scene_load_start( _path : String ) -> void :
	show();
	
func _on_scene_load_finished() -> void :
	hide();
