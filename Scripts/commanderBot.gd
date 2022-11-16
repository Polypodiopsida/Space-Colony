extends Spatial

var botIntake
var botElecCost
var botRawCost
var botRefCost
var botGoldCost
var botNuclearCost
var botBuildTime

var maxCommandLimit

var commandList = []

var selected

onready var kb = $KinematicBody

func _ready():
	pass

func _process(delta):
	pass

func _physics_process(delta):
	pass
	
func _order_bot():
	print("Bot ordered to do action.")

func _on_KinematicBody_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			print("test open")
			selected = true
		elif event.button_index == BUTTON_LEFT && selected:
			print("test close")
			selected = false
