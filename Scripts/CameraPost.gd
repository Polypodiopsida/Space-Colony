extends Spatial

var selected

func _on_Area_input_event(camera, event, position, normal, shape_idx): #DUMBASS DON'T FORGET THAT YOU NEED TO CONNET THE AREA WITH THE RIGHT SIGNAL
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT:
			print("test")
			selected = true
