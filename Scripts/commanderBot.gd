extends Spatial

var speed = 10
onready var navMesh = get_parent().get_node("Navigation")

var vel = Vector3()

var path = []
var path_index = 0

var botIntake
var botElecCost
var botRawCost
var botRefCost
var botGoldCost
var botNuclearCost
var botBuildTime

var commandLimit = 3

var commandList = []

var active = true
var selected = false
var acceptingTask = true

var commandingObject

var commanding

onready var kb = $KinematicBody
onready var guiPanel = $Panel
onready var activeText = $Panel/ActiveLabel
onready var activeButton = $Panel/ActiveButton
onready var commandButton = $Panel/commandButton
onready var commandListGUI = $Panel/commandList
onready var taskText = $Panel/taskLabel
onready var playerNode = get_parent().get_node("PlayerNode")

func _ready():
	self.add_to_group("Command Bots")

func _process(delta):
	if active:
		activeText.bbcode_text = "Active"
	else:
		activeText.bbcode_text = "Inactive"
		
	if activeButton.is_pressed():
		active = true
	else:
		active = false
		
	if commandButton.is_pressed() && acceptingTask:
		_order_bot()
		acceptingTask = false
		
	commandListGUI.bbcode_text = str(commandList)

func _physics_process(delta):
	if commandingObject != null && !commanding:
		print("Going to area")
		path = NavigationServer.map_get_path(navMesh, self.transform.origin, commandingObject.global_transform.origin, false)
		vel = kb.move_and_collide(path[path_index])
		print(path[path_index])
			
func _order_bot():
	print("Bot ordered to do action.")
	playerNode.isCommanding = true
	_gather_bots()
	
func _found_object(objectFound):
	commandingObject = objectFound
	print("Found the object ", objectFound)
	kb.look_at(Vector3(objectFound.global_transform.origin), Vector3.UP)
	if commandingObject != null && commandingObject.global_transform.origin.distance_to(kb.global_transform.origin) > 10:
		print("too far")
	else:
		print("commanding")
		var commanding = true
	
func _gather_bots():
	var allBots = get_tree().get_nodes_in_group("Regular Bots")
	commandList = allBots.slice(0, commandLimit - 1)
	for i in range(0, commandList.size()):
		commandList[i].remove_from_group("Regular Bots")
	print(get_tree().get_nodes_in_group("Regular Bots"))

func _on_KinematicBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			guiPanel.visible = true
			selected = true
		elif event.button_index == BUTTON_LEFT && selected:
			guiPanel.visible = false
			selected = false
