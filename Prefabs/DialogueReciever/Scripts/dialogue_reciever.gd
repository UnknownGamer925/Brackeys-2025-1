extends Node3D
@export_file("*json") var dialogue_file: String
var dialogue_text = {}
var selected_text = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainManager.connect("display_dialogue",Callable( self, "_on_display_dialogue"))
	dialogue_text = load_scene_text()

# Function that runs when the signal is emitted
func _on_display_dialogue(dialogue_key):
	if dialogue_text.has(dialogue_key):
		selected_text = dialogue_text[dialogue_key].duplicate()
		print(selected_text[0])
	else:
		print("Dialogue key not found:", dialogue_key)
	
func load_scene_text():
	if FileAccess.file_exists(dialogue_file):
		var file = FileAccess.open(dialogue_file, FileAccess.READ)
		var json_data = JSON.parse_string(file.get_as_text())

		if json_data is Dictionary:  # Ensure it's a valid Dictionary
			return json_data
		else:
			print("Error: Invalid JSON format in", dialogue_file)
			return {}  # Return an empty dictionary instead of null
		print("Error: Dialogue file not found:", dialogue_file)
		return {}  # Return an empty dictionary if file is missing
