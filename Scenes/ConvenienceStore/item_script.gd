extends StaticBody3D

@onready var SpriteRef : Sprite2D = $"../../../CanvasLayer/Control/Node2D/Sprite2D"
@onready var HUDcontrol : Control = $"../../../CanvasLayer/Control"
@export var texture : Texture2D

func interaction():
	SpriteRef.texture = texture
	HUDcontrol.mouse_filter = Control.MOUSE_FILTER_STOP
	
func release():
	SpriteRef.texture = null
	HUDcontrol.mouse_filter = Control.MOUSE_FILTER_IGNORE
