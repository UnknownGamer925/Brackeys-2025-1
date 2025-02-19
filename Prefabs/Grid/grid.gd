extends Node2D

var yBox = preload("res://Prefabs/WoodenSlideY/WoodenSlideY.tscn")
var xBox = preload("res://Prefabs/WoodenSlideX/WoodenSlideX.tscn")

var grid_size = 6
var cell_size = 50

var player

func _ready():
	setUp()

func _process(delta: float) -> void:
		if(player.global_position.x >=250):
			MainManager.BoxComplete = true
			SceneSwitcher.switch_scene(SceneSwitcher.SceneType.STORE)

func setUp() -> void:
	#Ys
	place_objects_in_grid(1,1, yBox,3, 0)
	place_objects_in_grid(1,4, yBox,2, 0)
	place_objects_in_grid(3,1, yBox,2, 0)
	place_objects_in_grid(4,2, yBox,2, 0)
	place_objects_in_grid(4,5, yBox,2, 0)
	place_objects_in_grid(5,2, yBox,2, 0)
	place_objects_in_grid(6,1, yBox,2, 0)
	place_objects_in_grid(6,3, yBox,2, 0)
	#Xs
	place_objects_in_grid(2,3, xBox,2, 1) #CHOSEN ONE
	place_objects_in_grid(2,4, xBox,2, 0) 
	place_objects_in_grid(4,1, xBox,2, 0) 
	place_objects_in_grid(4,4, xBox,2, 0) 

		
func place_objects_in_grid(xPos, yPos, box,length ,target):
	var pos = Vector2(xPos*cell_size, yPos * cell_size)
	var object_instance = box.instantiate()
	object_instance.position = pos
	object_instance.setUp(length, target)
	
	add_child(object_instance)
	if(target):
		player = object_instance 
	


func _on_button_pressed() -> void:
	for child in get_children():
		child.queue_free()
	setUp()
