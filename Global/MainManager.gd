extends Node

#Lock 
var MovementLocked = false

#3D Things
var HeldItem: Node3D
var ItemsPlaced : int
var Player: CharacterBody3D

#Objectives Complete
var TillComplete = false
var ShelvesStacks = false
var LightsComplete = false

var BadLights = false
var LockComplete = false
var BoxComplete = false

func inrease_shelf_int():
	ItemsPlaced += 1
	if (ItemsPlaced >= 4):
		pass
