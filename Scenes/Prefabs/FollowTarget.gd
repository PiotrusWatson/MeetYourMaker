extends PinJoint2D

@export var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func rotate_towards_point(point, delta):
	var angle = global_position.direction_to(point).angle()
	rotation = move_toward(rotation, angle, delta * speed)
