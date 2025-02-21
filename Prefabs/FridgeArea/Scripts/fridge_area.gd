extends Area3D

var isPlayer = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(isPlayer):
		AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.LIGHT_HUM)

func _on_body_entered(body: Node3D) -> void:
	isPlayer = true


func _on_body_exited(body: Node3D) -> void:
	isPlayer = false
