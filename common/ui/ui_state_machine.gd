extends Control

var _states : Dictionary = {};
var _currentState : UIState;

func _ready() -> void :
	for child : UIState in find_children( "*", "UIState" ) :
		_states[ child.name ] = child;
		
		if !child.default_state :
			child.hide();
		else :
			change_state( child.name );


func change_state( new_state : String, data : Dictionary = {} ) -> void :
	if _currentState != null :
		_currentState.change_requested.disconnect( change_state );
		_currentState.exit();
		
	_currentState = _states[new_state];
	_currentState.change_requested.connect( change_state );
	_currentState.enter( data );
