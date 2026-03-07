class_name InputButton
extends Button

@onready var action_label : Label = $MarginContainer/HBoxContainer/ActionLabel;
@onready var input_label : Label = $MarginContainer/HBoxContainer/InputLabel;

func set_action_label( value : String ) -> void :
	if action_label == null :
		return;
		
	action_label.text = value;


func set_input_label( value : String ) -> void :
	if input_label == null :
		return;
		
	input_label.text = value;
