extends Node

const SINGLEPLAYER_ID : int = 0;

var players : Dictionary = {};

func register_player( id : int, data : Dictionary ) -> void :
	data["id"] = id;
	players[id] = data;
	print( "Player %s registered" % id );
