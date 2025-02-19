extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_play_pressed():
	print("Play Pressed :)")
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.STORE)

func _on_options_pressed():
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.OPTIONS_MENU)

func _on_credits_pressed():
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.CREDIT_MENU)

func _on_quit_pressed():
	get_tree().quit()
