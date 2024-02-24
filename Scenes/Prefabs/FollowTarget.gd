extends Node2D

@export var speed = 100
@export var body_to_attach : Node
@onready var hand = $Hand
@onready var arm_joint = $Arm_Joint
# Called when the node enters the scene tree for the first time.
func _ready():
	if body_to_attach.has_method("get_collision_exceptions"):
		arm_joint.node_a = body_to_attach.get_path()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func rotate_towards_point(point, delta):
	var direction = (point - hand.global_position).normalized()
	hand.apply_central_force(direction * speed)
