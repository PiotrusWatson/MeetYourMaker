extends Node2D


@export var radius = 5.0
@export var speed = 10000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func move_towards_point(point, delta):
	var angle = global_position.direction_to(point).angle()
	rotation = move_toward(rotation, angle, speed)
