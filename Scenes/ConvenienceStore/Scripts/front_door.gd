extends Interactable

func _ready() -> void:
	MainManager.connect("update_dialogue",Callable( self, "updateDialogue"))

func updateDialogue():
	if(MainManager.BadLights):
		dialogue_key = "bad_door"
	else:
		if(MainManager.LightsComplete and MainManager.TillComplete and MainManager.ShelvesStacked and MainManager.hasKey):
			if(MainManager.hasKey):	
				dialogue_key = "good_end"
			else:
				dialogue_key = "no_key"
		else:
			dialogue_key = "good_tasks_unfinished"
