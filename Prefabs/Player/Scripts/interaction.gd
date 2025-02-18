extends Area3D

signal item_highlight(toggle:bool)

var in_view : Node3D
var held : Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if Input.is_action_just_pressed("left_click"):
		if in_view != null:
			if in_view.is_in_group("item"):
				held = in_view
				in_view.interaction()
			elif in_view.is_in_group("event") and held != null:
				in_view.place_item(held)


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("item") or body.is_in_group("event"):
		in_view = body
		item_highlight.emit(true)


func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("item")or body.is_in_group("event"):
		in_view = null
		item_highlight.emit(false)
