extends Node

var players : Dictionary = {}

signal player_added( id : int );
signal player_removed( id : int );

func register_player( id : int, data : Dictionary = {} ) -> void :
	print( 'Player %s joined' % id );
	data['id'] = id;
	players[id] = data;
	player_added.emit.call_deferred( id );
	
func remove_player( id : int ) -> void :
	print( 'Player %s left' % id );
	players[id] = null;
	player_removed.emit( id );
