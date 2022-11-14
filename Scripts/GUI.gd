extends CanvasLayer

onready var worldNode = get_parent()
onready var playerNode = get_parent().get_node("PlayerNode")
onready var elecText = get_node("Panel/Elec")
onready var rawText = get_node("Panel/rawMat")
onready var refText = get_node("Panel/refMetal")
onready var goldText = get_node("Panel/Gold")
onready var nuclearText = get_node("Panel/nuclearMat")

func _process(delta):
	elecText.set_bbcode(str("Electricity: ", playerNode.electricity))
	rawText.set_bbcode(str("Raw Materials: ", playerNode.rawMaterials))
	refText.set_bbcode(str("Refined Metals: ", playerNode.refMetals))
	goldText.set_bbcode(str("Gold: ", playerNode.gold))
	nuclearText.set_bbcode(str("Nuclear Materials: ", playerNode.nuclearMat))
	
func open_panel(panel):
	panel.visible = true
	
func close_panel(panel):
	panel.visible = false
