extends Spatial


var currentYear = 1
var currentMonth = 1
var currentDay = 1

func _ready():
	time_change()

func time_change():
	yield(get_tree().create_timer(0.2), "timeout")
	print("Day ",currentDay)
	currentDay += 1
	if currentDay == 31:
		currentMonth += 1
		currentDay = 1
		print("Month ", currentMonth)
	if currentMonth == 12:
		currentYear += 1
		currentMonth = 1
		print("Year ", currentYear)
		
	time_change()

func add_resources(electricityAdded, rawMetalsAdded, refMetalsAdded, goldAdded, nuclearMatAdded):
	print("Adding ", electricityAdded, " electricity, ", rawMetalsAdded, " Raw Metals ", refMetalsAdded, "Refined Metals, ", goldAdded, " Gold, and ", nuclearMatAdded, "Nuclear materials added")

func remove_resources(electricityRemoved, rawMetalsRemoved, refMetalsRemoved, goldRemoved, nuclearMatRemoved):
	print("Removing ", electricityRemoved, " electricity, ", rawMetalsRemoved, " Raw Metals ", refMetalsRemoved, "Refined Metals, ", goldRemoved, " Gold, and ", nuclearMatRemoved, "Nuclear materials added")
