extends Node2D


export var width = 10
export var length = 10
export var isSquare = true
export var tileMana = 5
var tile2DArray = [] #this will hold all of the Tile scenes that will be created


func _ready():
	#initialize width by length Tile scenes to create the map

