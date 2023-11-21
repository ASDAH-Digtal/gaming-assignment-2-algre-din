extends Node


signal checkpoints_collided(int)
signal stars_collected(int)

var checkpoints : int

var player : MainCharacter

var stars : int
var score : int = 0

var paused = false

var pause_menu
var win_screen
var score_label


func win():
	win_screen.visible = true
	
	score_label.text = "Score:" + str(score)

func checkpoints_collided_counter(collided_checkpoints:int):
	checkpoints += collided_checkpoints
	emit_signal("checkpoints_collided", collided_checkpoints)
	print(checkpoints)

func stars_collected_counter(collected_stars:int):
	stars += collected_stars
	emit_signal("stars_collected", collected_stars)
	print(stars)

func pause_play():
	paused = !paused
	
	pause_menu.visible = paused

func resume():
	get_tree().paused = false
	pause_play()

func restart():
	stars = 0
	checkpoints = 0
	score = 0
	get_tree().reload_current_scene()

func levels():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/levels.tscn")

func about():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/about.tscn")

func main_menu():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func level_1():
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")

func level_2():
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")

func level_3():
	get_tree().change_scene_to_file("res://scenes/level_3.tscn")
