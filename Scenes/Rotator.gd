extends Node2D

@export var rotation_speed = 10
var rigidbody: RigidBody2D
var rotating = false
var original_damp
# Called when the node enters the scene tree for the first time.

func init(parentbody: RigidBody2D):
	rigidbody = parentbody
	original_damp = rigidbody.linear_damp
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if rotating:
		rigidbody.apply_torque(rotation_speed)

func start_rotating():
	rigidbody.linear_damp = 10000
	rigidbody.physics_material_override.friction = 0
	rotating = true

func stop_rotating():
	rigidbody.linear_damp = original_damp
	rigidbody.physics_material_override.friction = 1
	rotating = false

