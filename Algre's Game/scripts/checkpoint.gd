extends Node2D
class_name Checkpoint

@export var win_condition = false

func _on_area_2d_area_entered(area):
	if win_condition:
		GameManager.win()
		queue_free()
	
	if area.get_parent() is MainCharacter:
		GameManager.checkpoints_collided_counter(1)
		GameManager.score += 50
		queue_free()
		
