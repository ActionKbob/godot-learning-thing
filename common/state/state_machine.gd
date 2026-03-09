class_name StateMachine
extends Node

var _states : Dictionary = {};
var _history : Array[String] = [];

var current_state : State :
	get() :
		if _history.size() > 0 && _states[ _history[0] ] != null :
			return _states[ _history[ 0 ] ]
			
		return null;

func register_state( id : String, state : State ) -> void :
	_states[id] = state;


func push_state( id : String ) -> void :
	_exit_current_state();
		
	_history.push_front( id );
	
	_enter_current_state();


func pop_state() -> void :
	_exit_current_state();
	
	_history.pop_front();
	
	_enter_current_state();
	

func _enter_current_state() -> void :
	if current_state != null :
		_states[ _history[0] ].enter();		


func _exit_current_state() -> void :
	if current_state != null :
		_states[ _history[0] ].exit();
