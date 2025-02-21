class_name SoundEffect 
extends Resource
## Sound effect resource, used to configure unique sound effects for use with the AudioManager. Passed to [method AudioManager.create_2d_audio_at_location()] and [method AudioManager.create_audio()] to play sound effects.

## Stores the different types of sounds effects available to be played to distinguish them from another. Each new SoundEffect resource created should add to this enum, to allow them to be easily instantiated via [method AudioManager.create_2d_audio_at_location()] and [method AudioManager.create_audio()].
enum SOUND_EFFECT_TYPE {
	FOOTSTEP_1,
	FOOTSTEP_2,
	FOOTSTEP_3,
	PAPER_RUSTLE,
	PICKUP,
	PLACING_ITEM_CAN_1,
	PLACING_ITEM_CAN_2, 
	PLACING_ITEM_BOX_1,
	PLACING_ITEM_BOX_2,
	TILL_OPEN,
	TILL_CLOSE,
	CASH_JINGLE,
	LIGHTSWITCH_CLICK_1,
	LIGHTSWITCH_CLICK_2,
	DOOR_LOCK,
	BOX_DRAG_1,
	BOX_DRAG_2,
	LOCK_CLICK_1,
	LOCK_CLICK_2,
	DIR_LOCK_WRONG,
	DIR_LOCK_RIGHT,
	MENU_CLICK_1,
	MENU_CLICK_2,
	MENU_CLICK_3,
	SHOVEL_HIT,
	LIGHT_HUM,
	EERIE_BG_1,
	EERIE_BG_2,
	EERIE_BG_3,
	BOMB_BEEP,
	LAYERED_EXPLOSION,
	TALKING_SINGLE,
	TALKING_LOOPED,
	MENU_MUSIC
}


@export_range(0, 10) var limit: int = 5 ## Maximum number of this SoundEffect to play simultaneously before culled.
@export var type: SOUND_EFFECT_TYPE ## The unique sound effect in the [enum SOUND_EFFECT_TYPE] to associate with this effect. Each SoundEffect resource should have it's own unique [enum SOUND_EFFECT_TYPE] setting.
@export var sound_effect: AudioStream #CHANGED FROM MP3 TO WAV
@export_range(-40, 20) var volume: float = 0 ## The volume of the [member sound_effect].
@export_range(0.0, 4.0,.01) var pitch_scale: float = 1.0 ## The pitch scale of the [member sound_effect].
@export_range(0.0, 1.0,.01) var pitch_randomness: float = 0.0 ## The pitch randomness setting of the [member sound_effect].

var audio_count: int = 0 ## The instances of this [AudioStreamMP3] currently playing.


## Takes [param amount] to change the [member audio_count]. 
func change_audio_count(amount: int) -> void:
	audio_count = max(0, audio_count + amount)


## Checkes whether the audio limit is reached. Returns true if the [member audio_count] is less than the [member limit].
func has_open_limit() -> bool:
	return audio_count < limit


## Connected to the [member sound_effect]'s finished signal to decrement the [member audio_count].
func on_audio_finished() -> void:
	change_audio_count(-1)
