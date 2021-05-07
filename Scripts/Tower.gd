extends Node2D

# Enemies should die after passing through 2 towers but they sometimes don't
# I'm not sure why this is happening but it might have something to do with movement being instant from one collider to another
func _on_Area2D_area_entered(area):
	area.get_parent().health -= 1
	if(area.get_parent().health <= 0):
		area.get_parent().queue_free()
		GameManager.enemies -= 1
