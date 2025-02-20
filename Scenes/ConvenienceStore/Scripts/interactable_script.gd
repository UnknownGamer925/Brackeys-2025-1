extends Node3D

var SpriteRef : Sprite2D 
var HUDcontrol : Control 

@export var texture : Texture2D
@export var ID: int

func _ready() -> void:
	SpriteRef = $"../../../CanvasLayer/Control/Node2D/Sprite2D"
	HUDcontrol = $"../../../CanvasLayer/Control"

func object() -> void:
	if(MainManager.HeldItem == null):
		MainManager.HeldItem = self
		visible = false
		position = Vector3(-5,-5,-5)
	

func area() -> void:
	for child in get_children():
		if(child.get("ID") != null):
			return
	#PLACE OBJECT CODE HERE
	if(MainManager.HeldItem != null):
		add_child(MainManager.HeldItem)
		MainManager.HeldItem.visible = true
		MainManager.HeldItem.global_position = global_position
		MainManager.HeldItem = null

func read() -> void:
	SpriteRef.texture = texture
	HUDcontrol.mouse_filter = Control.MOUSE_FILTER_STOP
	MainManager.MovementLocked = true
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		drop() 
	if event.is_action_pressed("Return"):
		release()

func drop() -> void: 
	if(MainManager.HeldItem != null):
		MainManager.HeldItem.visible = true
		MainManager.HeldItem.global_position = MainManager.Player.global_position
		MainManager.HeldItem = null
	
func release() -> void:
	if SpriteRef != null:
		SpriteRef.texture = null
		HUDcontrol.mouse_filter = Control.MOUSE_FILTER_IGNORE
		MainManager.MovementLocked = false
