class_name Component
extends Node

@export var _parent : Node;

func _ready() -> void:
	if !_parent :
		_parent = get_parent();
	
func get_peer_id() -> int :
	return int( _parent.name );
