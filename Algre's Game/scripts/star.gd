extends Node2D
class_name Star

func _on_area_2d_area_entered(area):
	if area.get_parent() is MainCharacter:
		GameManager.stars_collected_counter(1)
		GameManager.score += 100
		queue_free()
