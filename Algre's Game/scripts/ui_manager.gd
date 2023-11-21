extends CanvasLayer


func _ready():
	GameManager.pause_menu = $PauseMenu
	GameManager.win_screen = $WinScreen
	GameManager.score_label = $WinScreen/MarginContainer/VBoxContainer/Label
	GameManager.stars_collected.connect(update_star_display)

func update_star_display(_stars_collected):
	$"Star display".text = str(GameManager.stars)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		GameManager.pause_play()
	get_tree().paused = GameManager.paused

func _on_resume_pressed():
	GameManager.resume()


func _on_restart_pressed():
	GameManager.restart()


func _on_main_menu_pressed():
	GameManager.main_menu()


func _on_level_2_pressed():
	GameManager.level_2()


func _on_about_pressed():
	GameManager.about()
