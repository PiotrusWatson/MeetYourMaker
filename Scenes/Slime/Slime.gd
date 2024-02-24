extends CharacterBody2D

@export var gravity = 2000
@export var speed = 1000
@export var jump_speed = -1500
@export var jump_cooldown = 5
@export var damage_to_player = 1

const UP = Vector2(0,-1)

var animatedsprite
var start_jump_timer = 0.4
var start_jump= true
var start_start_jump_timer = true

var airborne = false
var player
var attack = false
var jump_timer = false
var dead = false 

func _ready():
	$AnimatedSprite2D.animation = "slime_default"
	$AnimatedSprite2D.play()

func _physics_process(delta):
	if dead:
		return
		
	velocity.y += gravity * delta
	
	if airborne and $AnimatedSprite2D.animation != "slime_death":
		$AnimatedSprite2D.animation = "slime_jump"
		
	if airborne and is_on_floor():
		$SlimeMoveSound.play()
		airborne = false
	
	if attack and jump_timer and is_on_floor():
		# If starting a jump, play the animation and start the timer to wait until the animation finishes
		if start_jump:
			$AnimatedSprite2D.animation = "slime_start_jump"
			if start_start_jump_timer:
				get_node("StartJumpTimer").start(start_jump_timer)
				start_start_jump_timer = false
		else:
			player = get_node("../Player")
			var direction = (player.position - self.position).normalized()
			velocity.y += jump_speed
			velocity.x = direction.x * speed
			jump_timer = false
			get_node("JumpCooldown").start(jump_cooldown)
	elif is_on_floor():
		$AnimatedSprite2D.animation = "slime_default"
		velocity.x = 0
	else:
		airborne = true 

	move_and_slide()


func _on_player_detect_body_entered(body):	
	if body.name == "Player":
		attack = true


func _on_player_detect_body_exited(body):
	if body.name == "Player":
		attack = false


func _on_start_jump_timer_timeout():
	start_jump = false


func _on_jump_cooldown_timeout():
	jump_timer = true
	start_jump = true
	start_start_jump_timer = true


func _on_player_on_top_body_entered(body):
	if body.name == "Player":
		death()


func _on_player_collider_body_entered(body):
	if body.name == "Player":
		body.damage(damage_to_player)


func _on_health_dead():
	death()
	
func death():
	velocity.x = 0
	attack = false
	dead = true
	$AnimatedSprite2D.animation = "slime_death"
	$AnimatedSprite2D.play()
	await $AnimatedSprite2D.animation_finished
	queue_free()

