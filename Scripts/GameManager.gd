extends Node

signal endTurn

var tileDict = {} #this will hold all of the Tile scenes that will be created

var playerMana: int = 0
var playerManaPerTurn: int = 0

var basePlaced = false
var baseLoc = Vector2(0,0)
var baseHealth = 10

var towerSelected = false

var enemies = 0

func endTurn():
	emit_signal("endTurn")
