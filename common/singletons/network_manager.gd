extends Node

const IP_ADDRESS = 'localhost';
const PORT = 42069;

signal multiplayer_session_started;

var peer : ENetMultiplayerPeer;

func host_game() -> void :
	print( 'Host' )
	peer = ENetMultiplayerPeer.new();
	peer.create_server( PORT );
	multiplayer.multiplayer_peer = peer;
	
	multiplayer_session_started.emit();
	
	
func join_game() -> void :
	print( 'Join' )
	peer = ENetMultiplayerPeer.new();
	peer.create_client( IP_ADDRESS, PORT );
	multiplayer.multiplayer_peer = peer;
	
