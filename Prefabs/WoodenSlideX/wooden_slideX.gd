extends CharacterBody2D

var isMouse
var mouse_left_down = false
var offset
var goRight = true
var goLeft = true
var ID = 0
var cell_size = 50
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(mouse_left_down):
		move(delta)
		
		
func setUp(multipler, target) -> void:
	
	scale *= Vector2(cell_size / 50, cell_size / 50)
	scale.x *= multipler
	
	
		

func move(delta):
	var direction = sign(global_position.x - (get_global_mouse_position().x - offset.x))
	var target_position = get_global_mouse_position().x - offset.x
	var movement = target_position - global_position.x 
	
	if direction == 1 and goLeft and position.x >= cell_size: 
		velocity.x = movement
	elif direction == -1 and goRight and position.x <= (cell_size*5) + 15 :
		velocity.x = movement
	else:
		velocity.x = 0

	move_and_slide()

func _on_area_2d_mouse_entered() -> void:
	isMouse = true;

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and isMouse and event.pressed:
			mouse_left_down = true
			offset = get_global_mouse_position() - global_position
			play_audio()
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			mouse_left_down = false
			isMouse = false;

func _on_area_2d_mouse_exited() -> void:
	if(!mouse_left_down):
		isMouse = false;
		


func _on_area_2d_area_entered(area: Area2D) -> void:
	var difference = area.global_position.x - global_position.x
	if(sign(difference) == 1):
		goRight = false
	elif(sign(difference) == -1):
		goLeft = false
	

func _on_area_2d_area_exited(area: Area2D) -> void:
	goRight = true
	goLeft = true

func play_audio():
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.BOX_DRAG_1)

		
