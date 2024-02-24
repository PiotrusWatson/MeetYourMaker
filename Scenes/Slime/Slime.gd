extends CharacterBody2D

@export var gravity = 1000
@export var speed = 1000
@export var jump_speed = -1000
@export var jump_cooldown = 5
const UP = Vector2(0,-1)
var player
var attack = false
var jump_timer = false

func _physics_process(delta):
	velocity.y += gravity * delta
	

	if attack and jump_timer and is_on_floor():
		player = get_node("../Player")
		var direction = (player.position - self.position).normalized()
		velocity.y += jump_speed
		velocity.x = direction.x * speed
		jump_timer = false
		get_node("JumpCooldown").start(jump_cooldown)
		get_node("AnimatedSprite2D").play("slime_jump")
	elif is_on_floor():
		get_node("AnimatedSprite2D").play("slime_default")
		velocity.x = 0
	
	move_and_slide()
	
func _on_player_detect_body_entered(body):
	if body.name == "Player":
		attack = true


func _on_player_detect_body_exited(body):
	if body.name == "Player":
		attack = false


func _on_timer_timeout():
	print("HELLO")
	jump_timer = true
	
