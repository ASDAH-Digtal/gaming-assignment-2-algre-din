extends Control

func _ready():
	$"VBoxContainer/ColorRect/MarginContainer/VBoxContainer/Level 1".grab_focus()

func _on_level_1_pressed():
	GameManager.level_1()


func _on_level_2_pressed():
	GameManager.level_2()


func _on_level_3_pressed():
	GameManager.level_3()


func _on_main_menu_pressed():
	GameManager.main_menu()
