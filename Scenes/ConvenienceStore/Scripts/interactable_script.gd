extends Node3D

@export var ID: int

func object() -> void:
	if(MainManager.HeldItem == null):
		MainManager.HeldItem = self
		visible = false
		position = Vector3(-5,-5,-5)
	

func area() -> void:
	for child in get_children():
		if(child.get("ID") != null):
			return
	#PLACE OBJECT CODE HERE
	if(MainManager.HeldItem != null):
		add_child(MainManager.HeldItem)
		MainManager.HeldItem.visible = true
		MainManager.HeldItem.global_position = global_position
		MainManager.HeldItem = null

func read() -> void:
	pass
	
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right_click"):
		drop() 

func drop() -> void: 
	if(MainManager.HeldItem != null):
		MainManager.HeldItem.visible = true
		MainManager.HeldItem.global_position = MainManager.Player.global_position
		MainManager.HeldItem = null
	
func release() -> void:
	pass 
