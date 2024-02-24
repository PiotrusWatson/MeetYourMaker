extends Area2D

var entered = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
		#get_tree().change_scene("")
			pass
		

func _on_body_entered(body: PhysicsBody2D):
	entered = true
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("")
		
	
	pass # Replace with function body.


func _on_body_exited(body: PhysicsBody2D):
	pass # Replace with function body.
