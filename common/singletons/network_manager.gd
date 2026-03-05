extends Node

const IP_ADDRESS = 'localhost';
const PORT = 42069;

var peer : ENetMultiplayerPeer;

var players : Dictionary = {};

func host_game() -> void :
	peer = ENetMultiplayerPeer.new();
	peer.create_server( PORT );
	multiplayer.multiplayer_peer = peer;
	
func join_game() -> void :
	peer = ENetMultiplayerPeer.new();
	peer.create_client( IP_ADDRESS, PORT );
	multiplayer.multiplayer_peer = peer;
