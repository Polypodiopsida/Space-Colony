extends Spatial

var rawMatCost = 10
var refMetalCost = 10
var electricityCost = 10
var goldCost = 10
var nuclearMaterialCost = 10

var nuclearIntake = 50 #How much nuclear material it takes in monthly
var electricityGeneration = 5050 #Per month, multiplied by the amount of bots working
var electricityCapacity = 125

onready var playerObject = get_parent().get_node("PlayerNode")
onready var world = get_parent().get_parent().get_node("TestWorld")
onready var GUI = get_parent().get_node("GUI")
onready var guiPanel = get_node("Panel")
onready var activeLabel = guiPanel.get_node("activeLabel")
onready var outputLabel = guiPanel.get_node("outputLabel")
onready var intakeLabel = guiPanel.get_node("intakeLabel")
onready var activeButton = guiPanel.get_node("Button")

var active = false
var matEmpty = false

var selected = false
func _ready():
	print(world.name)
	playerObject.rawMaterials -= rawMatCost
	playerObject.refMetals -= refMetalCost
	playerObject.electricity -= electricityCost
	playerObject.gold -= goldCost
	playerObject.nuclearMat -= nuclearMaterialCost
	build()
	
	
func build():
	print("Build started")
	yield(get_tree().create_timer(0.2), "timeout") #Make 60 after complete
	print("Build ended. Generator active.")
	active = true
	playerObject.elecMax += electricityCapacity

func _process(delta):
	if playerObject.nuclearMat <= nuclearIntake:
		active = false
		matEmpty = true
	else:
		active = true
		matEmpty = false
		
	if activeButton.is_pressed() && !matEmpty:
		active = true
		activeButton.disabled = false
	elif !activeButton.is_pressed() && !matEmpty:
		active = false
		activeButton.disabled = false
	else:
		active = false
		activeButton.disabled = true
	
	if world.addingResources && active:
		print("Adding and removing resources")
		world.add_resources(electricityGeneration, 0, 0, 0, 0)
		world.remove_resources(0, 0, 0, 0, nuclearIntake)
		
	if active:
		activeLabel.set_bbcode("Active")
	else:
		activeLabel.set_bbcode("Inactive")
	
	outputLabel.set_bbcode(str("Generating ", electricityGeneration, " electricity."))
	intakeLabel.set_bbcode(str("Intaking ", nuclearIntake, " nuclear materials."))
	
func _on_Area_input_event(camera, event, position, normal, shape_idx): #DUMBASS DON'T FORGET THAT YOU NEED TO CONNET THE AREA WITH THE RIGHT SIGNAL
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			if !playerObject.isCommanding:
				print("test open")
				selected = true
				GUI.open_panel(guiPanel)
			else:
				print("Commanding bots to run generator")
				playerObject.isCommanding = false
		elif event.button_index == BUTTON_LEFT && selected:
			print("test close")
			selected = false
			GUI.close_panel(guiPanel)
