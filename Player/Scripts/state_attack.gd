class_name State_Attack extends State

var attacking : bool = false
@onready var idle: State = $"../Idle"
@onready var walk: State = $"../Walk"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"

@onready var attack_anim : AnimationPlayer = $"../../Sprite2D/AttackEffect/AnimationPlayer"

@export var attack_sound : AudioStream
@onready var audio : AudioStreamPlayer2D = $"../../Audio/AudioStreamPlayer2D"

@export_range(1,20,0.5) var decelarate_speed: float = 5.0

#what happens when player enters this State?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attack_anim.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.9,1.1) #higher/lower tone
	audio.play()
	attacking = true
	pass

#what happens when player leaves this state?
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass
	
#what happens during process update in this staet?	
func Process( _delta: float) -> State:
	player.velocity -= player.velocity * decelarate_speed * _delta
	
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

#what happens during physics process update in this state
func Physics( _delta: float) -> State:
	return null
#what happens with input events in this state?
func HandleInput( _event: InputEvent) ->State:
	return null
	
func EndAttack(_newAnimName: String) -> void:
	attacking = false
