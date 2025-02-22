extends CharacterBody2D

var isMouse
var mouse_left_down = false
var offset
var goUp = true
var goDown = true
var ID = 0
var cell_size
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(mouse_left_down):
		move(delta)
		

func setUp(multipler, target) -> void:
	scale *= Vector2(cell_size / 50, cell_size / 50)
	scale.y *= multipler
	if(target == 1):
		modulate = Color(0.813, 0.322, 0)

func move(delta):
	var direction = sign(global_position.y - (get_global_mouse_position().y - offset.y))
	var target_position = get_global_mouse_position().y - offset.y
	var movement = target_position - global_position.y  
	
	if direction == 1 and goUp and position.y >= cell_size:
		velocity.y = movement
	elif direction == -1 and goDown and position.y <= cell_size * 5:  
		velocity.y = movement
	else:
		velocity.y = 0
	
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
	var difference = area.global_position.y - global_position.y
	if(sign(difference) == 1):
		goDown = false
	elif(sign(difference) == -1):
		goUp = false
	


func _on_area_2d_area_exited(area: Area2D) -> void:
	goUp = true
	goDown = true

func play_audio():
	AudioManager.create_audio(SoundEffect.SOUND_EFFECT_TYPE.BOX_DRAG_1)
