extends Node2D

@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func move_towards_point(point, thing_to_move: RigidBody2D):
	var direction = (point - thing_to_move.global_position).normalized()
	thing_to_move.apply_central_force(direction * speed)
