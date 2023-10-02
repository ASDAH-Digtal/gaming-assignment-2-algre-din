extends Control

func _ready():
	GameManager
	$"Main Menu".grab_focus()


func _on_main_menu_pressed():
	GameManager.main_menu()
