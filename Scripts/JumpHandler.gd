extends Node2D


@export var jump_strength_min = 10
@export var jump_strength_max = 100
@export var jump_strength_increment = 1

@onready var jump_timer = $JumpTimer
var player_rigidbody
var jump_strength
var grounded = false


func _ready():
	jump_strength = jump_strength_min
	
func init(rigidbody: RigidBody2D):
	player_rigidbody = rigidbody
	
func charge_jump():
	jump_timer.start()
	

func increment_jump():
	if jump_strength <= jump_strength_max:
		jump_strength += jump_strength_increment
	else:
		jump_strength = jump_strength_max
		
func reset_jump():
	jump_strength = jump_strength_min
	jump_timer.stop()
	
func jump():
	if grounded:
		player_rigidbody.apply_central_impulse(Vector2(0, -jump_strength))
	
	reset_jump()
	


func _on_jump_timer_timeout():
	increment_jump()



	


func _on_body_entered(body):
	grounded = true



func _on_body_exited(body):
	grounded = false
