extends Spatial

var botIntake
var botElecCost
var botRawCost
var botRefCost
var botGoldCost
var botNuclearCost
var botBuildTime

var maxCommandLimit = 3

var commandList = []

var active = true
var selected = false
var acceptingTask = true

onready var kb = $KinematicBody
onready var guiPanel = $Panel
onready var activeText = $Panel/ActiveLabel
onready var activeButton = $Panel/ActiveButton
onready var commandButton = $Panel/commandButton
onready var taskText = $Panel/taskLabel
onready var playerNode = get_parent().get_node("PlayerNode")

func _ready():
	pass

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

func _physics_process(delta):
	pass
	
func _order_bot():
	print("Bot ordered to do action.")
	playerNode.isCommanding = true

func _on_KinematicBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			guiPanel.visible = true
			selected = true
		elif event.button_index == BUTTON_LEFT && selected:
			guiPanel.visible = false
			selected = false
