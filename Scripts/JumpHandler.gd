extends Node2D


@export var jump_strength_min = 10
@export var jump_strength_max = 100
@export var jump_strength_increment = 1
@export var max_buffer_frames = 30
var buffer_frames = 0

var is_buffering = false
@onready var jump_timer = $JumpTimer
var player_rigidbody
var jump_strength
var grounded = false

signal hit_ground


func _ready():
	jump_strength = jump_strength_min
	
func init(rigidbody: RigidBody2D):
	player_rigidbody = rigidbody
	
func charge_jump():
	jump_timer.start()
	
func _process(delta):
	if !is_buffering:
		return
	if buffer_frames < max_buffer_frames:
		if handle_jump():
			reset_jump()
		buffer_frames += 1
		
	
func increment_jump():
	if jump_strength <= jump_strength_max:
		jump_strength += jump_strength_increment
	else:
		jump_strength = jump_strength_max
		
func reset_jump():
	jump_strength = jump_strength_min
	jump_timer.stop()
	is_buffering = false
	buffer_frames = 0

func handle_jump():
	if grounded:
		player_rigidbody.apply_central_impulse(Vector2(0, -jump_strength))
		reset_jump()
		return true
	return false
func jump():
	is_buffering = true
	
func _on_jump_timer_timeout():
	increment_jump()


func _on_body_entered(body):
	grounded = true
	hit_ground.emit()

func _on_body_exited(body):
	grounded = false
