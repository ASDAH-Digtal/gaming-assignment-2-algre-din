extends TileMap
class_name tilemap


func _on_area_2d_area_entered(area):
	if area.get_parent() is MainCharacter:
		area.get_parent().take_damage(1)
