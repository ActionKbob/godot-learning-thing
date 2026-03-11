extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

func _ready() -> void :
	print( "Player %s ready" % name );
	if is_multiplayer_authority() :
		_spawn_player_camera();


func _physics_process( _delta: float ) -> void :
	
	var x_direction := Input.get_axis("move_left", "move_right");
	var y_direction := Input.get_axis("move_up", "move_down");
	
	velocity = Vector2( x_direction * SPEED, y_direction * SPEED );
	
	move_and_slide();
		
	if velocity.x < 0 :
		$Sprite2D.flip_h = true;
	elif velocity.x > 0 :
		$Sprite2D.flip_h = false;
			
	position = position.round();


func _spawn_player_camera() -> void :
	var camera = Camera2D.new();
	camera.enabled = true;
	camera.zoom = Vector2.ONE * 4;
	add_child( camera );
