extends Camera

var mouseSensitivity = 0.05
var currentFOV

var xRot
var yRot

func _process(delta):
	
	var ud = 0
	var lr = 0
	
	if Input.is_action_pressed("cam_up") && !Input.is_action_pressed("cam_down"):
		ud = 1
	if Input.is_action_pressed("cam_down") && !Input.is_action_pressed("cam_up"):
		ud = -1
	if Input.is_action_pressed("cam_left") && !Input.is_action_pressed("cam_right"):
		lr = -1
	if Input.is_action_pressed("cam_right") && !Input.is_action_pressed("cam_left"):
		lr = 1
	
