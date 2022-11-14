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
var botMax #The max amount of robots you can have

var generators = []

var electricity = 1000
var elecMax = 1000
var rawMaterials = 1000
var rawMax = 1000
var refMetals = 1000
var refMax = 1000
var gold = 1000
var goldMax = 1000
var nuclearMat = 1000
var nuclearMax = 1000

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
		
	find_by_class(colony, "ClippedCamera", Cameras)

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
