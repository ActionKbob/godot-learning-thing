extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameStateManager.push_state( "main_menu" );
