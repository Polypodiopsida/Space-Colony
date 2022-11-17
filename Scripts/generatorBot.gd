extends Spatial

var botIntake
var botElecCost
var botRawCost
var botRefCost
var botGoldCost
var botNuclearCost
var botBuildTime

var active = true
var selected = false

onready var kb = $KinematicBody
onready var guiPanel = $Panel
onready var activeText = $Panel/ActiveLabel
onready var activeButton = $Panel/ActiveButton
onready var taskText = $Panel/taskLabel
onready var playerNode = get_parent().get_node("PlayerNode")

func _ready():
	self.add_to_group("Regular Bots")

func _process(delta):
	if active:
		activeText.bbcode_text = "Active"
	else:
		activeText.bbcode_text = "Inactive"
		
	if activeButton.is_pressed():
		active = true
	else:
		active = false

func _physics_process(delta):
	pass

func _on_KinematicBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			guiPanel.visible = true
			selected = true
		elif event.button_index == BUTTON_LEFT && selected:
			guiPanel.visible = false
			selected = false
