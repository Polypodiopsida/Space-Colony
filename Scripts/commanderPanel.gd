extends Panel

onready var playerNode = get_parent().get_parent().get_parent().get_node("PlayerNode")
onready var botAmount = $botAmount
onready var botUpkeep = $botUpkeep
onready var botCost = $costLabel
onready var buildButton = $Button
onready var destroyButton = $Button2

var botIntake = 10
var botElecCost = 50
var botRawCost = 10
var botRefCost = 20
var botGoldCost = 5
var botNuclearCost = 5

func _process(delta):
	botAmount.bbcode_text = str("Amount of Bots: ", playerNode.commandBots.size())
	botUpkeep.bbcode_text = str(botIntake, " Electricity Intake")
	botCost.bbcode_text = str("Costs: ", botElecCost, " electricity, ", botRawCost, " raw materials, ",
	botRefCost, " refined metals, ", botGoldCost, " gold and ", botNuclearCost, "nuclear materials.")
