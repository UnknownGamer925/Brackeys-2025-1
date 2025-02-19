extends CharacterBody3D


const SPEED = 400
var camera : Marker3D
@onready var animator : AnimationPlayer = $Pivot/Camera3D/Bobbing

func _ready() -> void:
	camera = $Pivot
	MainManager.Player = self

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

# movement & rotation
	var h_axis : float = Input.get_axis("c_left", "c_right")
	var v_axis : float = Input.get_axis("c_up","c_down")
	
	var direction : Vector3 = (camera.basis * Vector3(h_axis, 0, v_axis)).normalized()
	
	if direction != Vector3():
		animator.play("head_bob")
		
		
	
	
	if direction:
		velocity.x = direction.x * SPEED * delta
		velocity.z = direction.z * SPEED * delta
	else:
		velocity.x = move_toward(direction.x, 0, SPEED)
		velocity.z = move_toward(direction.z, 0, SPEED)
		

		
	move_and_slide()
