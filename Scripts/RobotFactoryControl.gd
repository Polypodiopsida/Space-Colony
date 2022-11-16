extends Spatial

onready var GUI = get_parent().get_node("GUI")
onready var guiPanel = $Panel
onready var commanderBotPanel = $Panel/commanderPanel
onready var commanderBotButton = $Panel/Button


var selected = false

func _on_Area_input_event(camera, event, position, normal, shape_idx): #DUMBASS DON'T FORGET THAT YOU NEED TO CONNET THE AREA WITH THE RIGHT SIGNAL
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			print("test open")
			selected = true
			GUI.open_panel(guiPanel)
		elif event.button_index == BUTTON_LEFT && selected:
			print("test close")
			selected = false
			GUI.close_panel(guiPanel)

func _process(delta):
	if commanderBotButton.is_pressed():
		commanderBotPanel.visible = true
	else:
		commanderBotPanel.visible = false
