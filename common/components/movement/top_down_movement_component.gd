class_name TopDownMovementComponent
extends Component

@export var input_component : InputComponent;
@export var speed : float = 100;

func _ready() -> void :
	super._ready();
	set_physics_process( multiplayer.is_server() );


func _physics_process( _delta : float ) -> void :	
	if input_component && _parent is CharacterBody2D :
		var movement_vector = input_component.movement_vector;
		_parent.velocity = movement_vector * speed;
		_parent.move_and_slide();
