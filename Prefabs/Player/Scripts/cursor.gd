extends Sprite2D

var idle_texture : Texture2D
var highlight_texture : Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = get_viewport_rect().size /2
	
	idle_texture = load("res://Prefabs/Player/Assets/cursor_idle.png")
	highlight_texture = load("res://Prefabs/Player/Assets/cursor_highlight.png")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_highlight(toggle: bool) -> void:
	if (toggle):
		texture = highlight_texture
	elif (!toggle):
		texture = idle_texture
