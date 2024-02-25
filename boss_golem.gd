extends CharacterBody2D

const rockpath = preload("res://Rock.tscn")
const damage_path= preload("res://Scripts/Health.gd")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const JUMP_VELOCITY = -400.0

var SPEED = 40
var player_chase = false
var player = null
var health = 100
var dead = true
var player_inacttack_zone = false
var can_take_damage = true


func _ready():
	dead = false

func _physics_process(delta):
	apply_gravity(delta)
	
	if !dead:
		$DetectionArea/CollisionShape2D.disabled = false
		#deal_with_damage() # This controls the golem getting hurt
		#
		# remove
		
		if  can_take_damage == true:
			$AnimatedSprite2D.play('Idle')
				
		
	if dead:
		$DetectionArea/CollisionShape2D.disabled = true
		
	
	
#	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta



func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		player = body
		print("in my detect")
		call_deferred("throw")
		# Put player throw here = true
		


func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		print("out my detect")
		#player_throw here = false
		player = null
	
	
func enemy():
	pass
	

#func _on_hit_box_body_entered(body):
#	if body.has_method("player"):
		#print("Player can hit me")
		#player_inacttack_zone = true
		#
		



#func _on_hit_box_body_exited(body):
#	if body.has_method("player"):
#		print("Player can't hit me")
#		player_inacttack_zone = false
			# Add emeny attacking detec
			
			
			
	
	
	#var health = damage_path.instantiate()
	
func damage(deal_damage):
	if can_take_damage == true:
		print("hurting")
		deal_damage = 20
		$TakeDamadge2.start()
		print("goli", health)
		can_take_damage = false
	if health <= 0:
			death()

func _on_take_damadge_2_timeout():
	can_take_damage = true
	
func death():
	dead = true
	print("Golemdeath")
	#$AnimatedSprite2D.play("die")
	#await get_tree().create_timer(1).timeout
	queue_free()


func throw():
	print("throw")
	var rock = rockpath.instantiate()
	$".".add_child(rock)
	rock.global_position = $ThrowArea.global_position
	
	
