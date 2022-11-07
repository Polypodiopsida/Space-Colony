extends Camera

var mouseSensitivity = 40
var currentFOV = 90

var ud = 0
var lr = 0

func _process(delta):
	if current:
		if Input.is_action_pressed("cam_up") && !Input.is_action_pressed("cam_down"):
			ud = 1
		elif Input.is_action_pressed("cam_down") && !Input.is_action_pressed("cam_up"):
			ud = -1
		else:
			ud = 0
		if Input.is_action_pressed("cam_left") && !Input.is_action_pressed("cam_right"):
			lr = -1
		elif Input.is_action_pressed("cam_right") && !Input.is_action_pressed("cam_left"):
			lr = 1
		else:
			lr = 0
			
func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				currentFOV -= 1
			if event.button_index == BUTTON_WHEEL_DOWN:
				currentFOV += 1
			if event.button_index == BUTTON_MIDDLE:
				currentFOV = 90
	
func _physics_process(delta):
	rotation_degrees.x += ud * mouseSensitivity * delta
	rotation_degrees.y -= lr * mouseSensitivity * delta
	currentFOV = clamp(currentFOV, 70, 110)
	
	fov = currentFOV
