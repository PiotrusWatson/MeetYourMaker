extends CharacterBody2D

@export var gravity = 2000
@export var speed = 100
@export var damage_to_player = 20

const UP = Vector2(0,-1)

var start_jump_timer = 0.4
var start_jump = true
var start_start_jump_timer = true
var attack = false
var dead = false
var player

func _ready():
	$AnimatedSprite2D.animation = "snail_move"
	$AnimatedSprite2D.play()
	$SnailMoveSound.play()
	

func _physics_process(delta):
	if dead:
		return
	
	velocity.y += gravity * delta
	velocity.x = speed
	if attack:
		player = get_tree().get_nodes_in_group("player")[0]
		var direction = (player.position - self.position).normalized()
		velocity.x = direction.x * speed
		
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	
	if $AnimatedSprite2D.animation != "snail_death":
		$AnimatedSprite2D.animation = "snail_move"
	
	move_and_slide()


func _on_player_detect_body_entered(body):	
	if body.name == "Player":
		attack = true
	if body.name == "Projectile":
		damage(body.damage)

func _on_player_detect_body_exited(body):
	if body.name == "Player":
		attack = false


func damage(amount):
	$SnailDamagedSound.play()
	$Health.damage(amount)

func _on_health_dead():
	death()


func _on_player_on_top_body_entered(body):
	if body.name == "Player":
		death()

	
func death():
	velocity.x = 0
	attack = false
	dead = true
	remove_child($PlayerCollider)
	remove_child($CollisionShape2D)
	
	$AnimatedSprite2D.animation = "snail_death"
	$AnimatedSprite2D.play()
	$SnailDeathSound.play()

	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.visible = false
	await $SnailDeathSound.finished
	queue_free()

func _on_player_collider_body_entered(body):
	if body.name == "Player":
		player.damage(damage_to_player)
