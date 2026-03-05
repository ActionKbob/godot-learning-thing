extends Node2D

const PlayerScene : PackedScene = preload( 'res://game/player/player.tscn' );

@onready var players_node = $Players;
@onready var object_tiles : TileMapLayer = $Environment/Objects;

var spawn_positions : Array[Vector2] = [];

func _ready() -> void :
	_build_spawn_points();
	
	_spawn_local_player();
	
func _spawn_local_player() -> void :
	var local_id = 1;
	var player_slot = 0;
	var new_player = PlayerScene.instantiate();
	new_player.name = "Player" + str( local_id );
	new_player.position = _get_spawn_position( player_slot );
	players_node.add_child( new_player );

func _build_spawn_points() -> void :
	if !object_tiles : 
		return;
		
	for cell in object_tiles.get_used_cells() :
		var tile_data = object_tiles.get_cell_tile_data( cell );
		if tile_data == null :
			continue;
		
		if tile_data.get_custom_data( "spawn_slot" ) :
			spawn_positions.append( object_tiles.map_to_local( cell ) );
			
		spawn_positions.sort_custom( func( a, b ) :
			return a.y < b.y || ( a.y == b.y && a.x == b.x );
		)

func _get_spawn_position( slot : int ) -> Vector2 :
	if spawn_positions.is_empty() :
		return Vector2.ZERO;
		
	return spawn_positions[ slot % spawn_positions.size() ];
