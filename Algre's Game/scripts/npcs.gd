extends CharacterBody2D
class_name NPC

@export var speed = 500

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)

func _on_area_2d_area_entered(area):
	if area.get_parent() is MainCharacter:
		area.get_parent().take_damage(1)
