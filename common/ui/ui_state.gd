class_name UIState
extends Control

@export var default_state : bool = false;

signal change_requested( new_state_id : String, data : Dictionary );

func enter( data : Dictionary ) -> void :
	show();
	
func exit() -> void :
	hide();
	
func request_change( new_state_id : String, data : Dictionary = {} ) -> void :
	change_requested.emit( new_state_id, data );
