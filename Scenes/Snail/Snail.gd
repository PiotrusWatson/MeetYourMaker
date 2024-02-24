extends RigidBody2D

@export var speed = 100
var velocity = Vector2.ZERO
var gravity = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()

func _physics_process(delta):
	velocity.x = speed
	var collision = move_and_collide(velocity * delta)
	velocity.y += gravity * delta
	if collision:
		speed *= -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += velocity * delta 
	if velocity.x < 0 :
		$AnimatedSprite2D.flip_h
	
