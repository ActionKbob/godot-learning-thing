class_name InputComponent
extends Component

# Top Down Controls
@export var movement_vector : Vector2;


func _ready() -> void :
	super._ready();
	set_multiplayer_authority( get_peer_id() );
	set_process( is_multiplayer_authority() );


func _process( _delta : float ) -> void :
	var x_direction : float = Input.get_axis("move_left", "move_right");
	var y_direction : float = Input.get_axis("move_up", "move_down");
	
	movement_vector = Vector2( x_direction, y_direction );
