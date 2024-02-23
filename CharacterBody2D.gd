extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

const JUMP_VELOCITY = -400.0

var SPEED = 40
var player_chase = false
var player = null
var health = 50
var dead = true
var damage
var player_inacttack_zone = false
var can_take_damage = true


func _ready():
	dead = false

func _physics_process(delta):
	apply_gravity(delta)
	
	if !dead:
		$DetectionArea/CollisionShape2D.disabled = false
		deal_with_damage() # This controls the golem getting hurt
		print("not dead")
		# remove
		
		if  can_take_damage == true:
			print("walking")
			$AnimatedSprite2D.play('Gollem Walk')
				
	if dead:
		$DetectionArea/CollisionShape2D.disabled = true
		print("Dead")
	
	
#	
func apply_gravity(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta




		
# fix this



func _on_detection_area_body_entered(body):
	if body.has_method("player"):
		print("in my detect")
		# Put player throw here = true
		player = body


func _on_detection_area_body_exited(body):
	if body.has_method("player"):
		print("out my detect")
		# player_throw here = false
		player = null
	
	
func enemy():
	pass
	

func _on_hit_box_body_entered(body):
	if body.has_method("player"):
		print("Player can hit me")
		player_inacttack_zone = true
		#
		



func _on_hit_box_body_exited(body):
	if body.has_method("player"):
		print("Player can't hit me")
		player_inacttack_zone = false
			# Add emeny attacking detec
			
			
			
	
func deal_with_damage():
	if player_inacttack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			print("hurting")
			health = health - 20
			$TakeDamadge.start()
			print("goli", health)
			can_take_damage = false
		if health <= 0:
			death()
			
			

func death():
	dead = true
	#$AnimatedSprite2D.play("die")
	#await get_tree().create_timer(1).timeout
	queue_free()

func _on_take_damage_timeout():
	can_take_damage = true





