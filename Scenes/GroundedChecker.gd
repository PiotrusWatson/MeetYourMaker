extends RayCast2D

@export var distance = 250
var is_grounded = false
signal grounded
signal airbourne
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	target_position = to_local(global_position + Vector2.DOWN * 250)
	if is_colliding() and !is_grounded:
		grounded.emit()
		is_grounded = true
	elif !is_colliding() and is_grounded:
		airbourne.emit()
		is_grounded = false
