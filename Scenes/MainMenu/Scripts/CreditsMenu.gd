extends Control

#func _ready():
	#AudioPlayer.play_music_menu()

func _on_back_pressed():
	SceneSwitcher.switch_scene(SceneSwitcher.SceneType.MAIN_MENU)
	play_audio()

func play_audio():
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.MENU_CLICK_3)
