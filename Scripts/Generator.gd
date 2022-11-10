extends Spatial

var rawMatCost = 10
var refMetalCost = 10
var electricityCost = 10
var goldCost = 10
var nuclearMaterialCost = 10

var nuclearIntake = 50#How much nuclear material it takes in monthly
var electricityGeneration = 50 #Per month
var electricityCapacity = 125

onready var playerObject = get_parent().get_node("PlayerNode")
onready var world = get_parent().get_parent().get_node("TestWorld")

var active = false

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
	if world.addingResources && active:
		print("Adding and removing resources")
		world.add_resources(electricityGeneration, 0, 0, 0, 0)
		world.remove_resources(0, 0, 0, 0, nuclearIntake)
