extends Node


func wait_for_seconds( delay : float ) -> void :
	await get_tree().create_timer( delay ).timeout;
	
