extends Node2D

@export var body_to_attach : RigidBody2D
@onready var hand = $Hand
@onready var arm_segment = $ArmSegment
@onready var arm_joint = $Arm_Joint
@onready var target_follower = $TargetFollower
@onready var shooter = $Shooter
@onready var shoot_sounds = $ShootSounds

func set_collision(is_colliding):
	hand.set_collision_layer_value(1, is_colliding)
	hand.set_collision_layer_value(2, is_colliding)
	hand.set_collision_mask_value(1, is_colliding)
	hand.set_collision_mask_value(2, is_colliding)
	arm_segment.set_collision_layer_value(1, is_colliding)
	arm_segment.set_collision_layer_value(2, is_colliding)
	arm_segment.set_collision_mask_value(1, is_colliding)
	arm_segment.set_collision_mask_value(2, is_colliding)

func activate():
	set_collision(true)
func init(gun_owner):
	shooter.init(gun_owner)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	arm_joint.node_a = body_to_attach.get_path()
	set_collision(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func rotate_towards_point(point):
	target_follower.move_towards_point(point, hand)

func shoot():
	shooter.shoot()
func _on_shooter_shot_thing():
	shoot_sounds.play_random()
