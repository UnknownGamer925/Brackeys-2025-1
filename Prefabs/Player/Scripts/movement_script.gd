extends CharacterBody3D


const SPEED = 5.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var h_axis : float = Input.get_axis("c_right", "c_left")
	var v_axis : float = Input.get_axis("c_down","c_up")
	
	position += Vector3 (h_axis * SPEED * delta, 0, v_axis * SPEED * delta)
	

	move_and_slide()
