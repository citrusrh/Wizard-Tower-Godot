extends Node2D

var baseResource = preload("res://Scenes/Base.tscn")
var towerResource = preload("res://Scenes/Tower.tscn")
onready var GameManager = get_node("/root/GameManager")
export var mana = 0
export var movementCost = 1
export var improved = false

export var gridPosition = Vector2(0,0)


func _ready():
	if(movementCost == 1):
		$ColorRect.color = Color8(252, 219, 3)
	elif(movementCost == 2):
		$ColorRect.color = Color8(252, 165, 3)
	elif(movementCost == 3):
		$ColorRect.color = Color8(252, 86, 3)
	
	if(improved == true):
		GameManager.playerManaPerTurn += mana


func _physics_process(_delta):
	$ManaLabel.text = mana as String;
	
	
func destroy():
	GameManager.playerManaPerTurn -= mana
	self.queue_free()


func _on_Button_pressed():
	if GameManager.basePlaced == false:
		self.add_child(baseResource.instance())
		GameManager.baseLoc = gridPosition
		GameManager.basePlaced = true
		improved = true
		GameManager.playerManaPerTurn += mana
	elif GameManager.towerSelected == true and GameManager.playerMana >= 5:
		self.add_child(towerResource.instance())
		improved = true
		GameManager.playerManaPerTurn += mana
		GameManager.playerMana -= 5
