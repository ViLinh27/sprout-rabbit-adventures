class_name State extends Node

static var player: Player #stores ref to plyaer that this State belongs to


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#what happens when player enters this State?
func Enter() -> void:
	pass

#what happens when player leaves this state?
func Exit() -> void:
	pass
	
#what happens during process update in this staet?	
func Process( _delta: float) -> State:
	return null

#what happens during physics process update in this state
func Physics( _delta: float) -> State:
	return null
#what happens with input events in this state?
func HandleInput( _event: InputEvent) ->State:
	return null
