extends Spatial

onready var GUI = get_parent().get_node("GUI")
onready var playerNode = get_parent().get_node("PlayerNode")
onready var guiPanel = $Panel
onready var commanderBotPanel = $Panel/commanderPanel
onready var commanderBotButton = $Panel/Button


var selected = false

func _on_Area_input_event(camera, event, position, normal, shape_idx): #DUMBASS DON'T FORGET THAT YOU NEED TO CONNET THE AREA WITH THE RIGHT SIGNAL
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == BUTTON_LEFT && !selected:
			if !playerNode.isCommanding:
				print("test open")
				selected = true
				GUI.open_panel(guiPanel)
			else:
				print("Commanding bot to run factory")
				playerNode.isCommanding = false
				var commandBots = []
				var commandBot
				commandBots = get_tree().get_nodes_in_group("Command Bots")
				for i in range(0, commandBots.size()):
					var testingBot = commandBots[i]
					print("Testing bots. ", testingBot)
					if testingBot.selected:
						commandBot = testingBot
						print("found bot", commandBot)
						commandBot._found_object(self)
		elif event.button_index == BUTTON_LEFT && selected:
			print("test close")
			selected = false
			GUI.close_panel(guiPanel)

func _process(delta):
	if commanderBotButton.is_pressed():
		commanderBotPanel.visible = true
	else:
		commanderBotPanel.visible = false
