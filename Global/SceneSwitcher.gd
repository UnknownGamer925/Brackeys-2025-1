
extends Node
enum SceneType {
	MAIN_MENU,
	CREDIT_MENU,
	OPTIONS_MENU,
	STORE,
	PUZZLE_TILL,
	PUZZLE_LIGHTS,
	PUZZLE_BOX,
	PUZZLE_LOCK,
	BAD_END,
	GOOD_END
}

const SCENES = {
	SceneType.MAIN_MENU: preload("res://Scenes/MainMenu/MainMenu.tscn"),
	SceneType.CREDIT_MENU: preload("res://Scenes/MainMenu/CreditsMenu.tscn"),
	SceneType.OPTIONS_MENU: preload("res://Scenes/MainMenu/OptionsMenu.tscn"),
	SceneType.STORE: preload("res://Scenes/ConvenienceStore/convenience_store.tscn"),
	SceneType.PUZZLE_TILL: preload("res://Scenes/TillPuzzle/TillPuzzle.tscn"),
	SceneType.PUZZLE_LIGHTS: preload("res://Scenes/LightPuzzle/Light Puzzle.tscn"),
	SceneType.PUZZLE_BOX: preload("res://Scenes/SlidingPuzzle/sliding_puzzle.tscn"),
	SceneType.PUZZLE_LOCK: preload("res://Scenes/DirectionalLock/DirectionalLock.tscn"),
	SceneType.BAD_END: preload("res://Scenes/Bad_Ending/Bad_Ending.tscn"),
	SceneType.GOOD_END: preload("res://Scenes/Good_Ending/Good_Ending.tscn")
}

var current_scene = null
var current_scene_type
func _ready() -> void:
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)
	
	

func switch_scene(scene_type: int) -> void:
	if (not SCENES.has(scene_type)):
		print("Invalid scene type:", scene_type)
		return	
	current_scene_type = scene_type
	
	_deferred_switch_scene(SCENES[scene_type].instantiate())
	
	
func _deferred_switch_scene(new_scene):
	if current_scene:
		current_scene.queue_free()

	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene
	if(current_scene_type != SceneType.STORE):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	current_scene = new_scene
	
	
func _input(event):
	if event.is_action_pressed("Esc"):
		switch_scene(SceneType.MAIN_MENU)
	if event.is_action_pressed("Return") and current_scene_type != SceneType.STORE:
		switch_scene(SceneType.STORE)
