extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_back_pressed():
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.MAIN_MENU)
