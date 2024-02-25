extends RigidBody2D

var parent: RigidBody2D
@export var damage = 30
@export var speed = 100
@onready var mover = $Mover
# Called when the node enters the scene tree for the first time.

func setup(firer: RigidBody2D):
	parent = firer
func _ready():
	mover.init(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	mover.move_player(transform.y * speed * delta)


func _on_hitbox_body_entered(body):
	if body != parent and body.has_method("damage"):
		body.damage(damage)
	print(body)
	if body != parent and body.has_method("destroy_crate"):
		body.destroy_crate()
	queue_free()
