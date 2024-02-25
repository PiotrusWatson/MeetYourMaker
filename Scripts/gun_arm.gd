extends Node2D

@export var body_to_attach : RigidBody2D
@onready var hand = $Hand
@onready var arm_joint = $Arm_Joint
@onready var target_follower = $TargetFollower
@onready var shooter = $Shooter

func init(gun_owner):
	shooter.init(gun_owner)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	arm_joint.node_a = body_to_attach.get_path()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func rotate_towards_point(point):
	target_follower.move_towards_point(point, hand)

func shoot():
	shooter.shoot()
	$Shooter/ShootSound.play()

