extends Node2D

@export var player_scene : PackedScene = preload( "res://game/player/player.tscn" );

func _ready() -> void:
	PlayerRegistry.player_added.connect( _on_player_added );
	PlayerRegistry.player_removed.connect( _on_player_removed );
	
	if PlayerRegistry.players.size() > 0 :
		for player in PlayerRegistry.players :
			_on_player_added( player );
		
func _on_player_added( id : int ) -> void :
	if !multiplayer.is_server() || !multiplayer.multiplayer_peer :
		return;
	
	var new_player = player_scene.instantiate();
	new_player.name = str( id );
	
	new_player.set_multiplayer_authority( id );
	
	add_child( new_player );


func _on_player_removed( _id : int ) -> void :
	pass;
