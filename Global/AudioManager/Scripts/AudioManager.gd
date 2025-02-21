extends Node2D
## Audio manager node. Inteded to be globally loaded as a 2D Scene. Handles [method create_2d_audio_at_location()] and [method create_audio()] to handle the playback and culling of simultaneous sound effects.
##
## To properly use, define [enum SoundEffect.SOUND_EFFECT_TYPE] for each unique sound effect, create a Node2D scene for this AudioManager script add those SoundEffect resources to this globally loaded script's [member sound_effects], and setup your individual SoundEffect resources. Then, use [method create_2d_audio_at_location()] and [method create_audio()] to play those sound effects either at a specific location or globally.
## 
## See https://github.com/Aarimous/AudioManager for more information.
##
## @tutorial: https://www.youtube.com/watch?v=Egf2jgET3nQ

var sound_effect_dict: Dictionary = {} ## Loads all registered SoundEffects on ready as a reference.

@export var sound_effects: Array[SoundEffect] ## Stores all possible SoundEffects that can be played.


func _ready() -> void:
	for sound_effect: SoundEffect in sound_effects:
		sound_effect_dict[sound_effect.type] = sound_effect



## Creates a sound effect if the limit has not been reached. Pass [param type] for the SoundEffect to be queued.
func create_audio(type: SoundEffect.SOUND_EFFECT_TYPE) -> AudioStreamPlayer:
	var new_audio: AudioStreamPlayer = AudioStreamPlayer.new()
	if sound_effect_dict.has(type):
		var sound_effect: SoundEffect = sound_effect_dict[type]
		if sound_effect.has_open_limit():
			sound_effect.change_audio_count(1)
			add_child(new_audio)
			new_audio.stream = sound_effect.sound_effect
			new_audio.volume_db = sound_effect.volume
			if(sound_effect.pitch_scale <= 0):
				new_audio.pitch_scale = 1
			else:	
				new_audio.pitch_scale = sound_effect.pitch_scale
			new_audio.pitch_scale += clamp(MainManager.rng.randf_range(-sound_effect.pitch_randomness, sound_effect.pitch_randomness ), -0.2, 0.2)
			new_audio.finished.connect(sound_effect.on_audio_finished)
			new_audio.finished.connect(new_audio.queue_free)
			new_audio.play()
	else:
		push_error("Audio Manager failed to find setting for type ", type)
	return new_audio
