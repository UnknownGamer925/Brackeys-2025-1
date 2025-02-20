extends Node2D
@export var key: Sprite2D
@export var boxFull: Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_ui()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_ui()
		
func update_ui(): 
	if(MainManager.hasKey):
		key.self_modulate.a = 1.0  
		key.modulate.a = 1.0 
	else:
		key.self_modulate.a = 0.5
		key.modulate.a = 0.5
		
	boxFull.visible = MainManager.HeldItem != null
