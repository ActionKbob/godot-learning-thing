class_name Reactive
extends RefCounted

signal dirty( reactive );

var parent : Reactive :
	set( value ) :
		if parent != null :
			dirty.disconnect( parent.emit );
		
		parent = value;
		
		if parent != null :
			dirty.connect( parent.emit );


func _init( initial_parent : Reactive = null ) -> void :
	parent = initial_parent;


func emit( reactive : Reactive = null ) -> void :
	dirty.emit( self );
	
