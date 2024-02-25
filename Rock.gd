extends CharacterBody2D
class_name Rock_projectile

# ATTEMP AT HONING

var speed := -20000
var lifetime := 3.0
var direction := Vector2.ZERO

@onready var timer := $Timer
@onready var sprite := $Sprite
@onready var Hitbox := $HitBox_Rock


# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_top_level(true)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_process(delta):
	velocity.x =  speed * delta
	move_and_slide()
	
	
	


func _on_hit_box_rock_body_entered(body):
	if body.has_method("player") and body.has_method("damage"):
		body.damage(10)
		queue_free()
	
		
		
		

