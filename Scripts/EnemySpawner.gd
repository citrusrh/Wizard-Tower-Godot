extends Node2D

var enemy = preload("res://Scenes/Enemy.tscn")
var location: Vector2

func _ready():
	location = get_parent().gridPosition
	GameManager.connect("endTurn", self, "_on_endTurn")

func _on_endTurn():
	if(GameManager.enemies < 4):
		var spawn = enemy.instance()
		spawn.location = location
		spawn.position = GameManager.tileDict[location].position + Vector2(10,10)
		get_parent().get_parent().get_parent().add_child(spawn)
		GameManager.enemies += 1
