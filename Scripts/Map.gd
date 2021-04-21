tool
extends Node2D

onready var GameManager = get_node("/root/GameManager")
var rn = RandomNumberGenerator.new()
var tileResource = preload("res://Scenes/Tile.tscn")
export(bool) var generateMap = false setget generate

export var side= 10
export var tileMaxMana = 5
export var tileDict = {} #this will hold all of the Tile scenes that will be created

func _ready():
	print_debug(tileDict[Vector2(side-1,side-1)].mana)


func generate(toggle):
	
	rn.randomize()
	
	if(toggle == true):
		for i in side:
			for j in side:
				var currentTile = tileResource.instance()
				currentTile.position = Vector2(45*j,45*i)
				currentTile.mana = rn.randi_range(1,tileMaxMana)
				currentTile.movementCost = rn.randi_range(1,3)
				currentTile.improved = true
				tileDict[Vector2(i,j)] = currentTile
				self.add_child(currentTile)
		generateMap = true
	else:
		for n in self.get_children():
			self.remove_child(n)
			n.queue_free()
		generateMap = false
