extends Node2D

@export var rotation_speed = 10
var rigidbody: RigidBody2D
var rotating = false

# Called when the node enters the scene tree for the first time.

func init(parentbody: RigidBody2D):
	rigidbody = parentbody
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if rotating:
		
		rigidbody.apply_torque(rotation_speed)

func start_rotating():
	rigidbody.physics_material_override.friction = 0
	rotating = true

func stop_rotating():
	rigidbody.physics_material_override.friction = 1
	rotating = false

