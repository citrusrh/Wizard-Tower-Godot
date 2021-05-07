extends Control

onready var GameManager = get_node("/root/GameManager")

func _on_EndTurn_pressed():
	
	if GameManager.basePlaced == false:
		print("Place your base first!")
	else:
		GameManager.playerMana += GameManager.playerManaPerTurn
		GameManager.endTurn()


func _physics_process(_delta):
	$CanvasLayer/ManaCount.text = "Mana: " + GameManager.playerMana as String + " (+" + GameManager.playerManaPerTurn as String + ")"
	$CanvasLayer/BaseIntegrity.text = "Base integrity: " + GameManager.baseHealth as String


func _on_TowerPurchaseToggle_toggled(button_pressed):
	if button_pressed == true:
		GameManager.towerSelected = true
	else:
		GameManager.towerSelected = false
