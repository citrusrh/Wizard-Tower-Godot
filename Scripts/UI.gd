extends Control

onready var GameManager = get_node("/root/GameManager")

func _on_EndTurn_pressed():
	GameManager.playerMana += GameManager.playerManaPerTurn
	

func _physics_process(delta):
	$CanvasLayer/ManaCount.text = "Mana: " + GameManager.playerMana as String
