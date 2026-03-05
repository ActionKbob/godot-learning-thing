extends Control

@onready var input_button_scene = preload("res://ui/user_inputs/input_button.tscn");
@onready var action_list_node = $Panel/MarginContainer/VBoxContainer/ScrollContainer/ActionList;

@export var input_action_filter : Array[KeyValuePair] = [];

var is_remapping = false;
var action_to_remap = null;
var remapping_button : InputButton = null;

func _ready() -> void :
	_load_keybindings_from_config();	
	_populate_action_list();
	
func _load_keybindings_from_config() -> void :
	var keybindings = ConfigFileHandler.load_keybindings();
	
	for action in keybindings.keys() :
		InputMap.action_erase_events( action );
		InputMap.action_add_event( action, keybindings[ action ] );
	
func _input( event ) -> void :
	if is_remapping :
		if event is InputEventKey or ( event is InputEventMouseButton and event.is_pressed() ) :
			
			if event is InputEventMouseButton and event.double_click :
				event.double_click = false;
			
			InputMap.action_erase_events( action_to_remap );
			InputMap.action_add_event( action_to_remap, event );
			
			# Save new keybinding
			ConfigFileHandler.save_keybinding( action_to_remap, event );
			
			_update_action_list( remapping_button, _nice_input_text( event.as_text() ) );
			
			
			is_remapping = false;
			remapping_button = null;
			action_to_remap = null;
			
			accept_event();
	
func _populate_action_list() -> void :
	_clear_action_list();
	
	for action in input_action_filter :
		var button_instance = input_button_scene.instantiate() as InputButton;
		action_list_node.add_child( button_instance );
		
		var input_text = "";
		var action_events = InputMap.action_get_events( action.key );
		if action_events.size() > 0 :
			input_text = _nice_input_text( action_events[0].as_text() );
		
		button_instance.set_action_label( 
			input_action_filter.filter( 
				func( item ) : return item.key == action.key 
			).front().value if input_action_filter.any( func( item ) : return item.key == action.key ) else ""
		);
		button_instance.set_input_label( input_text );
		
		button_instance.pressed.connect( _on_input_button_pressed.bind( button_instance, action ) );
	
func _update_action_list( button : InputButton, input_text : String ) -> void :
	button.set_input_label( input_text )

func _on_input_button_pressed( button, action ) -> void :
	if !is_remapping :
		is_remapping = true;
		action_to_remap = action.key;
		remapping_button = button;
		
		remapping_button.set_input_label( "...Press key to rebind" );

func _clear_action_list() -> void :
	if action_list_node == null :
		return;
		
	for item in action_list_node.get_children() : 
		item.queue_free();
		
func _nice_input_text( text : String ) -> String :
	return text.trim_suffix("- Physical");


func _on_reset_button_pressed() -> void :
	InputMap.load_from_project_settings();
	
	for action in input_action_filter :
		var events = InputMap.action_get_events( action.key );
		if events.size() > 0 :
			ConfigFileHandler.save_keybinding( action.key, events[0] );
 	
	_populate_action_list();
