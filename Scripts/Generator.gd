extends Spatial

var refMetalCost = 10
var electricityCost = 10
var goldCost = 10
var nuclearMaterialCost = 10

var nuclearIntake #How much nuclear material it takes in monthly
var electricityGeneration #Per month
var electricityCapacity #Adds to the max capacity

onready var playerObject = get_parent().get_node("PlayerNode")
onready var world = get_parent().get_parent()

var active = false

func _ready():
	print(world.name)
	playerObject.refMetals -= refMetalCost
	playerObject.electricity -= electricityCost
	playerObject.gold -= goldCost
	playerObject.nuclearMat -= nuclearMaterialCost
	
	
func build():
	print("Build started")
	yield(get_tree().create_timer(60), "timeout")
	print("Build ended. Generator active.")
	active = true

func _process(delta):
	pass
	#if world.currentDay == 31 && active:
		#world.add_resources(electricityGeneration, 0, 0, 0, 0)
		#world.remove_resources(0, 0, 0, 0, nuclearIntake)
