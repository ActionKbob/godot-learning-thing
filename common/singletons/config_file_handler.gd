extends Node

const SECTION_ID = {
	KEYBINDINGS = "keybindings"	
}

const SETTINGS_PATH = "user://settings.ini";

var config : ConfigFile = ConfigFile.new();

func _ready() -> void :
	if !FileAccess.file_exists( SETTINGS_PATH ) :
		config.save( SETTINGS_PATH );
	else :
		config.load( SETTINGS_PATH );
		
func load_keybindings() :
	var keybindings = {};
	
	if config.has_section( SECTION_ID.KEYBINDINGS ) :
		for key in config.get_section_keys( SECTION_ID.KEYBINDINGS ) :
			var input_event;
			var event_string = config.get_value( SECTION_ID.KEYBINDINGS, key );
			
			if( event_string.contains( "mouse_" ) ) :
				input_event = InputEventMouseButton.new();
				input_event.button_index = int( event_string.split( "-" )[1] );
			else : 
				input_event = InputEventKey.new();
				input_event.keycode = OS.find_keycode_from_string( event_string );
				
			keybindings[ key ] = input_event;
		
	return keybindings;
	
func save_keybinding( action : StringName, event : InputEvent ) -> void :
	var event_string;
	
	if event is InputEventKey :
		event_string = OS.get_keycode_string( event.physical_keycode )
	elif event is InputEventMouseButton :
		event_string = "mouse_" + str( event.button_index );
		
	config.set_value( SECTION_ID.KEYBINDINGS, action, event_string );
	config.save( SETTINGS_PATH );
