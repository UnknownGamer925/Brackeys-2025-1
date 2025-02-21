extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_back_pressed():
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.MAIN_MENU)
	play_audio()

func play_audio():
	var randomInt = MainManager.rng.randi_range(1,3)
	match randomInt:
		1:
			AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MENU_CLICK_1)
		2:
			AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MENU_CLICK_2)
		3:
			AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MENU_CLICK_3)
