extends Node2D


@export var speed = 4.0

var player_rigidbody


func init(rigidbody: RigidBody2D):
	player_rigidbody = rigidbody
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func move_player(direction):
	player_rigidbody.apply_central_force(direction * speed)

	
		
	
	

