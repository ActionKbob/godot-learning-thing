class_name GameState
extends State

signal state_ready;

func enter( _data : Dictionary = {} ) -> void :
	state_ready.emit();
