extends Node

signal server_created;

const IP_ADDRESS : String = "localhost";
const PORT : int = 42069;

var peer : ENetMultiplayerPeer;

func host_game() -> void :
	peer = ENetMultiplayerPeer.new();
	peer.create_server( PORT );
	multiplayer.multiplayer_peer = peer;
	
	multiplayer.peer_connected.connect( PlayerRegistry.register_player );
	multiplayer.peer_disconnected.connect( PlayerRegistry.remove_player );
	
	PlayerRegistry.register_player( 1 );
	server_created.emit();
	
func join_game() -> void :
	peer = ENetMultiplayerPeer.new();
	peer.create_client( IP_ADDRESS, PORT );
	multiplayer.multiplayer_peer = peer;
