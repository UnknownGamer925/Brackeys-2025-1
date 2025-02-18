extends Marker3D

var cam : Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.warp_mouse(Vector2(position.x, position.y))
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	cam = $Camera3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton: # if mouse clicks anything in game window, capture cursor
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif event.is_action_pressed("ui_cancel"): # if 'esc' pressed, release cursor
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		
	if (Input.mouse_mode == Input.MOUSE_MODE_CAPTURED) and (event is InputEventMouseMotion):
		rotate_y(-event.relative.x * 0.01)
		cam.rotate_x(-event.relative.y * 0.01)
		cam.rotation.x = clamp(cam.rotation.x, deg_to_rad(-30), deg_to_rad(60))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	#var mouse_x : float = cam.project_ray_normal()
	#var mouse_y : float = get_viewport().get_mouse_position().y
	
	#transform.basis = Basis(Vector3.RIGHT, mouse_x)
	#print(mouse_x)
	
