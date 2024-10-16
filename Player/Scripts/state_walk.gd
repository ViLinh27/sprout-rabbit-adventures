class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle : State = $"../Idle"
@onready var attack: State = $"../Attack"
#what happens when player enters this State?
func Enter() -> void:
	player.UpdateAnimation("walk")
	pass

#what happens when player leaves this state?
func Exit() -> void:
	pass
	
#what happens during process update in this staet?	
func Process( _delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	player.velocity = player.direction * move_speed
	if player.SetDirection():
		player.UpdateAnimation("walk")
		
	return null

#what happens during physics process update in this state
func Physics( _delta: float) -> State:
	return null
#what happens with input events in this state?
func HandleInput( _event: InputEvent) ->State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
