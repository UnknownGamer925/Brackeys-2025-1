extends Interactable

func _ready() -> void:
	MainManager.connect("bad_ending_enabled",Callable(self, "disappear"))
	
func object() -> void:
	if(MainManager.BadLights):
		visible = false
		position = Vector3(-5,-5,-5)
		MainManager.hasTorch = true
		
func appear():
	visible = false
	#SET POSITION OF TORCH HERE 
