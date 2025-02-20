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
		key.visible = true
	else:
		key.visible = false
		
	boxFull.visible = MainManager.HeldItem != null
