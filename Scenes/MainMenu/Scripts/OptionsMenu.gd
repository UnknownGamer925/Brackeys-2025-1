extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenu.tscn")

func _on_resolutions_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(2560, 1440))
			get_window().move_to_center()
			print("2560 x 1440")
		1:
			DisplayServer.window_set_size(Vector2i(1920, 1080))
			get_window().move_to_center()
			print("1920 x 1080")
		2:
			DisplayServer.window_set_size(Vector2i(1280, 720))
			get_window().move_to_center()
			print("1280 x 720")
		3:
			DisplayServer.window_set_size(Vector2i(1024, 600))
			get_window().move_to_center()
			print("1024 x 600")
		4:
			DisplayServer.window_set_size(Vector2i(800, 600))
			get_window().move_to_center()
			print("800 x 600")

func _on_check_box_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		get_window().move_to_center()
