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

	if not $PlayerRoll:
		return
	# A bunch of stuff to check if we should play the rolling sound and the volume
	if abs(player_rigidbody.linear_velocity.y) > 4:
		$PlayerRoll.stop()
		return

	if not $PlayerRoll.playing and abs(player_rigidbody.angular_velocity) > 1:
		$PlayerRoll.play()
		$PlayerRoll.volume_db = -25 + abs(player_rigidbody.angular_velocity)
	elif $PlayerRoll.playing and abs(player_rigidbody.angular_velocity) < 1:
		$PlayerRoll.stop()
		
	
	

