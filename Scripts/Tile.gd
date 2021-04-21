extends Node2D

onready var GameManager = get_node("/root/GameManager")
export var mana = 0
export var movementCost = 1
export var improved = true

#I will attach an invisible button to the Tile scene that will reveal other buttons that the player can click to alter the tile

func _ready():
	if(movementCost == 1):
		$ColorRect.color = Color8(252, 219, 3)
	elif(movementCost == 2):
		$ColorRect.color = Color8(252, 165, 3)
	elif(movementCost == 3):
		$ColorRect.color = Color8(252, 86, 3)
	
	if(improved == true):
		GameManager.playerManaPerTurn += mana


func _physics_process(delta):
	$ManaLabel.text = mana as String;
	
	
func destroy():
	GameManager.playerManaPerTurn -= mana
	self.queue_free()
