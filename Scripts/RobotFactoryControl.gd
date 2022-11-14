extends Spatial

func _on_Area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			print("test")
