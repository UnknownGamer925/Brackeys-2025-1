extends Node2D
@export var Combination:Array[int]
@export var TillTotal:Array[int]
@export var TillDisplay:Label
var acceptInput: bool
var UserInput: Array



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func UpdateDisplay() -> void:
	var formatted_text = ""
	for num in UserInput: 
		formatted_text += str(num)
		
	#TillDisplay.text.insert(TillDisplay.text.length() -2, ".")
	if formatted_text.length() > 2:
		formatted_text = formatted_text.insert(formatted_text.length() - 2, ".")
	else:
		formatted_text = "0." + formatted_text.pad_zeros(2)
	TillDisplay.text = formatted_text
		
func _on_enter_button_pressed() -> void:
	if Combination == UserInput:
		if(Combination != TillTotal):
			print("Till Open count money!!")
			Combination = TillTotal
			call_deferred("create_cash_jingle")
		else:
			MainManager.TillComplete = true
			call_deferred("create_cash_jingle")
			SceneSwitcher.switch_scene(SceneSwitcher.SceneType.STORE)
			print("Yay!")
		TillDisplay.text = "00.00"
	else:
		TillDisplay.text = "4O4"
		AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.DIR_LOCK_WRONG)
	UserInput.clear()

func create_cash_jingle():
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.CASH_JINGLE)

func _on_clear_button_pressed() -> void:
	TillDisplay.text = "00.00"
	UserInput.clear()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
	
func _on_button_1_pressed() -> void:
	UserInput.append(1)	
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
	
func _on_button_2_pressed() -> void:
	UserInput.append(2)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_3_pressed() -> void:
	UserInput.append(3)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_4_pressed() -> void:
	UserInput.append(4)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_5_pressed() -> void:
	UserInput.append(5)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_6_pressed() -> void:
	UserInput.append(6)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_7_pressed() -> void:
	UserInput.append(7)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_8_pressed() -> void:
	UserInput.append(8)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_9_pressed() -> void:
	UserInput.append(9)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
func _on_button_0_pressed() -> void:
	UserInput.append(0)
	UpdateDisplay()
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LOCK_CLICK_1)
