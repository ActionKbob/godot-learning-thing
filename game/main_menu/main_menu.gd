extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void :
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process( _delta : float ) -> void :
	pass;


func _on_button_pressed() -> void :
	GameStateManager.push_state( "singleplayer" );


func _on_host_game_button_pressed() -> void:
	GameStateManager.push_state( "host_game" );


func _on_join_game_button_pressed() -> void:
	GameStateManager.push_state( "join_game" );
