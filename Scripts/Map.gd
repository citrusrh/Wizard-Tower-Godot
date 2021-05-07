tool
extends Node2D

onready var GameManager = get_node("/root/GameManager")
var rn = RandomNumberGenerator.new()
var tileResource = preload("res://Scenes/Tile.tscn")
var enemySpawnerResource = preload("res://Scenes/EnemySpawner.tscn")
export(bool) var generateMap = false setget generate

export var side: int
export var tileMaxMana: int


func _ready():
	generate(false)
	generate(true)
	GameManager.tileDict[Vector2(0,0)].add_child(enemySpawnerResource.instance())
	GameManager.tileDict[Vector2(side-1,0)].add_child(enemySpawnerResource.instance())
	GameManager.tileDict[Vector2(0,side-1)].add_child(enemySpawnerResource.instance())
	GameManager.tileDict[Vector2(side-1,side-1)].add_child(enemySpawnerResource.instance())


func generate(toggle):
	
	rn.randomize()
	
	if(toggle == true):
		for i in side:
			for j in side:
				var currentTile = tileResource.instance()
				currentTile.position = Vector2(45*j,45*i)
				currentTile.mana = rn.randi_range(1,tileMaxMana)
				currentTile.movementCost = rn.randi_range(1,3)
				GameManager.tileDict[Vector2(i,j)] = currentTile
				currentTile.gridPosition = Vector2(i,j)
				self.add_child(currentTile)
		generateMap = true
		
	else:
		for n in self.get_children():
			self.remove_child(n)
			n.queue_free()
		generateMap = false
