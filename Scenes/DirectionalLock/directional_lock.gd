extends Node2D
@export var Lock:Sprite2D
@export var Combination:Array[int]
var UserInput: Array[int]
var isMouse
var mouse_left_down = false
var puzzleStarted = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Lock.rotation_degrees = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(mouse_left_down and puzzleStarted):
		turnLock(delta)
	elif(puzzleStarted):
		checkPos()
	if(UserInput.size() == 4):
		confirm(delta)


func turnLock(delta) ->void:
	if(Lock.rotation_degrees >= 360):
		Lock.rotation = 0
	Lock.rotate(0.5 * PI * delta) 

func checkPos() ->void:
	if(Lock.rotation_degrees <= 365 && Lock.rotation_degrees >= 360 || 
	Lock.rotation_degrees <= 10 && Lock.rotation_degrees >= 0):
		UserInput.append(1)	
	
	if(Lock.rotation_degrees <= 95 && Lock.rotation_degrees >= 85):
		UserInput.append(2)	
	
	if(Lock.rotation_degrees <= 185 && Lock.rotation_degrees >= 175):
		UserInput.append(3)	
		
	if(Lock.rotation_degrees <= 275 && Lock.rotation_degrees >= 265):
		UserInput.append(4)	
	puzzleStarted = false
	print(UserInput)

func confirm(delta) -> void:
	if (Combination == UserInput):
		print("yay!")
	else:
		UserInput.clear()
		puzzleStarted = false
		Lock.rotate( PI * delta) 

func _on_area_2d_mouse_entered() -> void:
	isMouse = true;

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and isMouse and event.pressed:
			mouse_left_down = true
			puzzleStarted = true
		elif event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			mouse_left_down = false

func _on_area_2d_mouse_exited() -> void:
	if(!mouse_left_down):
		isMouse = false;


func _on_button_pressed() -> void:
	UserInput.clear()
	puzzleStarted = false
	Lock.rotation_degrees = 0
