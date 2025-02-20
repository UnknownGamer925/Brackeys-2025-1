extends Node

#Lock 
var MovementLocked = false

#3D Things
var HeldItem: Node3D
var ItemsPlaced : int
var Player: CharacterBody3D

#Objectives Complete
var TillComplete = false
var ShelvesStacked = false
var LightsComplete = false

var hasKey = false
var hasTorch = false 

var BadLights = false
var LockComplete = false
var BoxComplete = false

signal display_dialogue(dialogue_key)
signal update_dialogue()

signal bad_ending_enabled()

func _process(delta: float) -> void:
	if(BadLights):
		emit_signal("bad_ending_enabled")

func inrease_shelf_int():
	ItemsPlaced += 1
	if (ItemsPlaced >= 4):
		pass