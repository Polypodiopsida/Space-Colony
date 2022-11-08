extends Spatial

onready var map = $Area

var gridSize = Vector3()
var cellSize = 1 

func _ready():
	map.scale.x = round(map.scale.x)
	map.scale.y = round(map.scale.y)
	map.scale.z = round(map.scale.z)
	
	gridSize.x = map.scale.x
	gridSize.y = map.scale.y
	gridSize.z = map.scale.z
	print(gridSize)

