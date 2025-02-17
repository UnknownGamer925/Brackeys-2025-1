extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenu.tscn")
