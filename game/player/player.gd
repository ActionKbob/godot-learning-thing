extends CharacterBody2D
	
func _ready() -> void :
	
	if multiplayer.get_unique_id() == int(name) :
		$Camera2D.enabled = true;
	else :
		$Camera2D.enabled = false;
	
	print( "Player %s ready" % name );
		
	if !multiplayer.is_server() :
		set_physics_process( false );
		set_process( false );
