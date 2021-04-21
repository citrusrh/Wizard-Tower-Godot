extends Camera2D

export var panSpeed = 100

func _physics_process(delta):
	if(Input.is_action_pressed("up")):
		self.position.y -= panSpeed * delta
	if(Input.is_action_pressed("down")):
		self.position.y += panSpeed * delta
	if(Input.is_action_pressed("left")):
		self.position.x -= panSpeed * delta
	if(Input.is_action_pressed("right")):
		self.position.x += panSpeed * delta
#	if(Input.is_action_pressed("zoom_in")):
#		self.zoom.x + 1
#		self.zoom.y + 1
#	if(Input.is_action_pressed("zoom_in")):
#		self.zoom.x - 1
#		self.zoom.y - 1
