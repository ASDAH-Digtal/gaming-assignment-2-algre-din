extends Control

func _ready():
	$VBoxContainer/VBoxContainer/Start.grab_focus()
	


func _on_start_pressed():
	GameManager.level_1()


func _on_levels_pressed():
	GameManager.levels()


func _on_about_pressed():
	GameManager.about()


func _on_quit_pressed():
	get_tree().quit()
