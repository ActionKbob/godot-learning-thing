extends Node2D


func _ready() -> void:
	GameStateManager.push_state( "main_menu" );
