extends Spatial

onready var colony = get_parent()
var Cameras = []

var currentCamera = 0

var commandBots = []
var builderBots = []
var repairBots = []
var defenseBots = []
var miningBots = []
var furnacaeBots = []

func find_by_class(node: Node, className: String, result: Array) -> void:
	if node.is_class(className):
		result.push_back(node)
	for child in node.get_children():
		find_by_class(child, className, result)
		
func _ready():
	find_by_class(colony, "ClippedCamera", Cameras)
	print(Cameras)
	
func _process(delta):
	var n = 0
	if Input.is_action_just_pressed("camera_next"):
		n = 1
		switch_cameras(Cameras, n)
	if Input.is_action_just_pressed("camera_prev"):
		n = -1
		switch_cameras(Cameras, n)

func switch_cameras(camList : Array, n : int):
	if n == 1 && currentCamera < camList.size() -1:
		currentCamera += 1
		camList[currentCamera].set_current(true)
	elif n == 1 && currentCamera == camList.size() - 1:
		currentCamera = 0
		camList[currentCamera].set_current(true)
	
	if n == -1 && currentCamera >= 0:
		currentCamera -= 1
		camList[currentCamera].set_current(true)
	if n == -1 && currentCamera < 0:
		currentCamera = camList.size() - 1
		camList[currentCamera].set_current(true)
	
	
	print(currentCamera)
	print(camList[currentCamera])
