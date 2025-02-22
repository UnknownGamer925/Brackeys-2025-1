extends Marker3D

var Horizontal: float
var Vertical: float
var UpDown: float
var Direction: Vector3
var Speed: int = 5
var CameraLock: bool = false
@onready var Camera: Camera3D = $Camera3D

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	Horizontal = Input.get_axis("c_left", "c_right")
	Vertical = Input.get_axis("c_up", "c_down")
	UpDown = Input.get_axis("ControlKey", "SpaceKey")
	
	Direction = (basis * Vector3(Horizontal, UpDown, Vertical))
	position += Direction * Speed * delta
	
	if Input.is_action_pressed("ShiftKey"):
		Speed = 15
	else:
		Speed = 5
		
	if Input.is_action_just_pressed("Flashlight"):
		if !CameraLock:
			CameraLock = true
		elif CameraLock:
			CameraLock = false
	
func _input(event: InputEvent) -> void:
	if !CameraLock:
		if event is InputEventMouseMotion:
			rotate_y(-event.relative.x * 0.01)
			Camera.rotate_x(-event.relative.y * 0.01)
			Camera.rotation.x = clamp(Camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
