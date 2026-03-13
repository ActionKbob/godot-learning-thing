class_name Component
extends Node

var _parent : Node;

func _ready() -> void:
	_parent = get_parent();
	
func get_peer_id() -> int :
	return int( _parent.name );
