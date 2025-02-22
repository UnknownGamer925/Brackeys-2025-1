extends Node2D
@export var key: Sprite2D
@export var boxFull: Sprite2D
@export var Title: RichTextLabel
@export var Obj1: CheckBox
@export var Obj2: CheckBox
@export var Obj3: CheckBox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainManager.connect("shelves_stacked",Callable( self, "shelf"))
	MainManager.connect("till_complete",Callable( self, "till"))
	MainManager.connect("lights_off",Callable( self, "lights"))
	MainManager.connect("bad_ending_enabled",Callable( self, "bad"))
	MainManager.connect("has_key", Callable(self, "has_key"))
	update_ui()

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_ui()
		
func update_ui():
	boxFull.visible = MainManager.HeldItem != null
	
func has_key():
	key.visible = true
	
func bad():
	print("hello")
	Obj1.visible = false
	Obj2.visible = false
	Obj3.visible = false
	Title.text = "FIND A WAY OUT"
	
func shelf():
	Obj1.button_pressed = true
func till():
	Obj2.button_pressed = true
func lights():
	Obj3.button_pressed = true
	print("hello")
