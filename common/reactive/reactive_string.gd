class_name ReactiveString
extends Reactive

var value : String :
	set( val ) :
		value = val;
		emit( self );
		return value;

func _init( initial_value : String, initial_parent : Reactive = null ) -> void :
	super._init( initial_parent );
	value = initial_value;
