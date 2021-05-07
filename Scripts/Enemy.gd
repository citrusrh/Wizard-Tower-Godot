extends Node2D

onready var GameManager = get_node("/root/GameManager")
var location: Vector2
var health = 2
var movementAllowance = 3

func _ready():
	GameManager.connect("endTurn", self, "_on_endTurn")

func _on_endTurn():
	
	while(movementAllowance > 0):
		
		if(location.x > GameManager.baseLoc.x and location.y > GameManager.baseLoc.y):
			if(GameManager.tileDict[Vector2(location.x-1,location.y)].movementCost < GameManager.tileDict[Vector2(location.x,location.y-1)].movementCost):
				location = Vector2(location.x-1,location.y)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			else:
				location = Vector2(location.x,location.y-1)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x > GameManager.baseLoc.x and location.y == GameManager.baseLoc.y):
			location = Vector2(location.x-1,location.y)
			movementAllowance -= GameManager.tileDict[location].movementCost
			position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x > GameManager.baseLoc.x and location.y < GameManager.baseLoc.y):
			if(GameManager.tileDict[Vector2(location.x-1,location.y)].movementCost < GameManager.tileDict[Vector2(location.x,location.y+1)].movementCost):
				location = Vector2(location.x-1,location.y)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			else:
				location = Vector2(location.x,location.y+1)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x == GameManager.baseLoc.x and location.y < GameManager.baseLoc.y):
			location = Vector2(location.x,location.y+1)
			movementAllowance -= GameManager.tileDict[location].movementCost
			position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x < GameManager.baseLoc.x and location.y < GameManager.baseLoc.y):
			if(GameManager.tileDict[Vector2(location.x+1,location.y)].movementCost < GameManager.tileDict[Vector2(location.x,location.y+1)].movementCost):
				location = Vector2(location.x+1,location.y)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			else:
				location = Vector2(location.x,location.y+1)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x < GameManager.baseLoc.x and location.y == GameManager.baseLoc.y):
			location = Vector2(location.x+1,location.y)
			movementAllowance -= GameManager.tileDict[location].movementCost
			position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x < GameManager.baseLoc.x and location.y > GameManager.baseLoc.y):
			if(GameManager.tileDict[Vector2(location.x+1,location.y)].movementCost < GameManager.tileDict[Vector2(location.x,location.y-1)].movementCost):
				location = Vector2(location.x+1,location.y)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			else:
				location = Vector2(location.x,location.y-1)
				movementAllowance -= GameManager.tileDict[location].movementCost
				position = GameManager.tileDict[location].position + Vector2(10,10)
			
		elif(location.x == GameManager.baseLoc.x and location.y > GameManager.baseLoc.y):
			location = Vector2(location.x,location.y-1)
			movementAllowance -= GameManager.tileDict[location].movementCost
			position = GameManager.tileDict[location].position + Vector2(10,10)
			
		else:
			self.queue_free()
			GameManager.enemies -= 1
			GameManager.baseHealth -= 1
			if(GameManager.baseHealth <= 0):
				get_tree().change_scene("res://Scenes/GameOver.tscn")
			break

	movementAllowance = 3
