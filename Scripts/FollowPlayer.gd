extends Camera2D

@export var camera_speed = 0.5
@export var thing_to_follow : RigidBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = lerp(global_position, thing_to_follow.global_position, camera_speed * delta)
