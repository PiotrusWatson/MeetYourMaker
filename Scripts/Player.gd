extends RigidBody2D

@onready var movement = $BasicPlayerMovement
var horizontal = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	movement.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	horizontal = Input.get_axis("Left", "Right")

func _physics_process(delta):
	movement.move_player(Vector2(horizontal, 0))
