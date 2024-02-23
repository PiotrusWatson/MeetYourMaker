extends CharacterBody2D


var speed = -20000
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	velocity.x = speed * delta
	move_and_slide()
	
	


func _on_hit_box_rock_body_entered(body):
	if body.has_method("player") and body.has_method("damage"):
		body.damage(5)
	queue_free()
	
		
		
		

