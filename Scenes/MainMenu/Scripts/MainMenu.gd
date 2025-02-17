extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_play_pressed():
	print("Play Pressed :)")
	get_tree().change_scene_to_file("res://Scenes/ConvenienceStore/convenience_store.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu/OptionsMenu.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu/CreditsMenu.tscn")

func _on_quit_pressed():
	get_tree().quit()
